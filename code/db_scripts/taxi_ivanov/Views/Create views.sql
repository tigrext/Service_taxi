--5 самых частых мест поездки пассажиров
create or replace view often_place_for_trip as
select p.name as ФИО, ad.house_number as Дом, s.name as Улица, c.name as Город, coun.name as Страна from
    (select passenger_id, end_trip_address_id as often_place from
        (select passenger_id,
        count(passenger_id) as count_trips,
        end_trip_address_id,
        row_number() over(order by count(passenger_id) desc) as rn
        from order1
        where status = 'trip_completed'
        group by passenger_id, end_trip_address_id
        order by passenger_id)
    where count_trips >= 10
    and rn <= 5
    order by count_trips desc) a
left join passenger p on p.id = a.passenger_id
left join address ad on ad.id = a.often_place
left join street s on s.id = ad.street_id
left join city c on c.id = s.city_id
left join country coun on coun.id = c.country_id

-----------------------------------------------------------------------
--тарифы на бензин в городах по датам
create or replace view gasoline_rates_by_date as
select Город, Дата_заправки, avg(Gas_Price_per_liter) as Цена_бензина_за_литр  from
(select Город, Дата_заправки, round((paid_gasoline / amount_gasoline) * rate) as Gas_Price_per_liter from
    (select cit.name as Город, trunc(r.time_create, 'day') as Дата_заправки, c.id, c.name as currency, sum(r.amount_of_gasoline) as amount_gasoline, sum(p.amount_to_paid) as paid_gasoline, rat.rate from refueling r
    left join payment p on r.payment_id = p.id
    left join currency c on c.id = p.currency_id
    left join rate rat on rat.currency2_id = c.id
    left join car ca on ca.id = r.car_id
    left join parking park on park.id = ca.parking_id
    left join city cit on cit.id = park.city_id
    group by cit.name, r.time_create, c.id, c.name, rat.rate))
group by Город, Дата_заправки
order by Дата_заправки

--------------------------------------------------------------------------------------------------------------
--cредний чек за поездку в разных странах
create or replace view avg_price_for_taxi_in_countries as
select c.name as Страна, round(avg(p.amount_to_paid*r.rate)) as Средний_чек_за_поездку_в_рублях from country c
left join city cit on cit.country_id = c.id
left join street s on s.city_id = cit.id
left join address a on a.street_id = s.id
left join way w on w.from_address_id = a.id
left join order1 o on o.id = w.order_id
left join payment p on p.id = o.payment_id
left join currency cur on cur.id = p.currency_id
left join rate r on r.currency2_id = cur.id
where o.status != 'canceled'
group by c.name

--------------------------------------------------------------------------------------------------------------
--месячную динамика цен на проезд за 1 километр в городах России
create or replace view price_for_km_in_rus_cities as
select Дата, Город, round(avg(Price_km)) Цена_км from
(select trunc(o.time_create, 'day') as Дата, cit.name as Город, round((p.amount_to_paid*r.rate)/w.distance) as Price_km from country c
left join city cit on cit.country_id = c.id
left join street s on s.city_id = cit.id
left join address a on a.street_id = s.id
left join way w on w.from_address_id = a.id
left join order1 o on o.id = w.order_id
left join payment p on p.id = o.payment_id
left join currency cur on cur.id = p.currency_id
left join rate r on r.currency2_id = cur.id
where o.status != 'canceled' 
and c.name = 'Russia'
order by Дата)
group by Дата, Город


/*11.  Создать представление, которое для каждого пользователя,
который хотя бы раз пользовался услугами такси, подберёт 5 водителей,
с которыми данный пользователь ещё не ездил, но у которых средняя оценка выше 4.*/
CREATE OR REPLACE VIEW select_top_driver
as
    SELECT
    tab7.name               as Пассажир,
    tab6.name               as Водитель,
    Рейтинг_водителя
FROM  (SELECT
            ИД_пассажира,
            ИД_водителя,
            Рейтинг_водителя,
            RN_водителя
        FROM   (SELECT
                    tab3.passenger_id                                                           as  ИД_пассажира,
                    tab3.Driver_id                                                              as  ИД_водителя,
                    tab4.rating                                                                 as  Рейтинг_водителя,
                    row_number() over (PARTITION BY tab3.passenger_id ORDER BY tab3.Driver_id)  as  RN_водителя
                FROM (SELECT
                        passenger_id,
                        Driver_id
                      FROM
                        (SELECT
                              passenger_id
                         FROM order1
                         GROUP BY passenger_id)tab1                       
                         cross join
                        (SELECT 
                            id          as Driver_id
                         FROM driver) tab2
                      minus     
                      SELECT
                         passenger_id,
                         driver_id
                      FROM order1
                      GROUP BY passenger_id,
                             driver_id) tab3
                INNER JOIN driver_rating tab4
                    on(tab3.Driver_id = tab4.driver_id)
                WHERE    tab4.rating >=4                                        
                ORDER BY tab3.passenger_id,
                         tab3.Driver_id)
        WHERE RN_водителя <=5)tab5                                              
INNER JOIN driver tab6
    on(tab6.id=tab5.ИД_водителя)                                                
INNER JOIN passenger tab7                                                       
    on(tab7.id=tab5.ИД_пассажира);