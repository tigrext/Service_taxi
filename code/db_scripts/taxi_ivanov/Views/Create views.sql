--5 ����� ������ ���� ������� ����������
create or replace view often_place_for_trip as
select p.name as ���, ad.house_number as ���, s.name as �����, c.name as �����, coun.name as ������ from
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
--������ �� ������ � ������� �� �����
create or replace view gasoline_rates_by_date as
select �����, ����_��������, avg(Gas_Price_per_liter) as ����_�������_��_����  from
(select �����, ����_��������, round((paid_gasoline / amount_gasoline) * rate) as Gas_Price_per_liter from
    (select cit.name as �����, trunc(r.time_create, 'day') as ����_��������, c.id, c.name as currency, sum(r.amount_of_gasoline) as amount_gasoline, sum(p.amount_to_paid) as paid_gasoline, rat.rate from refueling r
    left join payment p on r.payment_id = p.id
    left join currency c on c.id = p.currency_id
    left join rate rat on rat.currency2_id = c.id
    left join car ca on ca.id = r.car_id
    left join parking park on park.id = ca.parking_id
    left join city cit on cit.id = park.city_id
    group by cit.name, r.time_create, c.id, c.name, rat.rate))
group by �����, ����_��������
order by ����_��������

--------------------------------------------------------------------------------------------------------------
--c������ ��� �� ������� � ������ �������
create or replace view avg_price_for_taxi_in_countries as
select c.name as ������, round(avg(p.amount_to_paid*r.rate)) as �������_���_��_�������_�_������ from country c
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
--�������� �������� ��� �� ������ �� 1 �������� � ������� ������
create or replace view price_for_km_in_rus_cities as
select ����, �����, round(avg(Price_km)) ����_�� from
(select trunc(o.time_create, 'day') as ����, cit.name as �����, round((p.amount_to_paid*r.rate)/w.distance) as Price_km from country c
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
order by ����)
group by ����, �����


/*11.  ������� �������������, ������� ��� ������� ������������,
������� ���� �� ��� ����������� �������� �����, ������� 5 ���������,
� �������� ������ ������������ ��� �� �����, �� � ������� ������� ������ ���� 4.*/
CREATE OR REPLACE VIEW select_top_driver
as
    SELECT
    tab7.name               as ��������,
    tab6.name               as ��������,
    �������_��������
FROM  (SELECT
            ��_���������,
            ��_��������,
            �������_��������,
            RN_��������
        FROM   (SELECT
                    tab3.passenger_id                                                           as  ��_���������,
                    tab3.Driver_id                                                              as  ��_��������,
                    tab4.rating                                                                 as  �������_��������,
                    row_number() over (PARTITION BY tab3.passenger_id ORDER BY tab3.Driver_id)  as  RN_��������
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
        WHERE RN_�������� <=5)tab5                                              
INNER JOIN driver tab6
    on(tab6.id=tab5.��_��������)                                                
INNER JOIN passenger tab7                                                       
    on(tab7.id=tab5.��_���������);