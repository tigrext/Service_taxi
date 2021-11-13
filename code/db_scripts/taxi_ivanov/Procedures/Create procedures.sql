-- Процедура для бронирования автомобиля водителем
create or replace procedure car_reservation (in_driver_id number,
                                             in_car_id number) 
as
    cursor c_car
    is
    select id,
           is_reserved
    from car
    where id = in_car_id;

---------------------------------------------------------------------------------------------------------------------------------------

begin
    for r in c_car loop

    if r.is_reserved = 0 and r.id = in_car_id then
        insert into rent (driver_id, car_id, date_start) values (in_driver_id, in_car_id, sysdate);

        update car set is_reserved = '1' where id = in_car_id;
    else
        dbms_output.put_line('Автомобиль уже забронирован');
    end if; 
    end loop;
Commit;
end;

---------------------------------------------------------------------------------------------------------------------------------------

-- Процедура снятия автомобиля с брони
create or replace procedure car_unreservation (in_car_id number,
                                               in_gas_mileage number,
                                               in_distance number) 
as
begin
    update rent set date_stop = sysdate, gas_mileage = gas_mileage + in_gas_mileage, distance = distance + in_distance where car_id = in_car_id;
    update car set is_reserved = '0', mileage = mileage + in_distance where id = in_car_id;
Commit;
end;

---------------------------------------------------------------------------------------------------------------------------------------

-- Процедура заправки автомобиля
create or replace procedure car_refueling (in_car_id number,
                                           in_amount_of_gasoline number,
                                           in_amount_to_paid number,
                                           in_currency_id number,
                                           in_type varchar2) 
as
begin
    insert into payment (amount_to_paid, currency_id, type) values (in_amount_to_paid, in_currency_id, in_type);
    
    insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ((select r.driver_id from rent r left join car c on r.car_id = c.id where r.car_id = in_car_id and r.date_stop is null), in_car_id, sysdate, (select max(id) from payment), in_amount_of_gasoline);
Commit;
end;

---------------------------------------------------------------------------------------------------------------------------------------

-- Процедура создания заказа
create or replace procedure order_creation (in_passenger_id number,
                                            in_address_id number,
                                            in_massive_address_id varchar2,
                                            in_massive_distance varchar2,
                                            in_amount_to_paid number,
                                            in_currency_id number,
                                            in_type varchar2) 
as
    in_massive_address_id_a varchar2(1000);
    in_to_address_id_a varchar2(1000);
    lenght_in_address_id number;
    p_id varchar2(1000);
    o_id varchar2(1000);
    v_a apex_application_global.vc_arr2;
    v_b apex_application_global.vc_arr2;
    v_c apex_application_global.vc_arr2;
    
    cursor c_way
    is
    select from_address_id,
           to_address_id,
           order_id,
           preview_way_id,
           distance
    from mytable;
    
begin
    insert into payment (amount_to_paid, currency_id, type) values (in_amount_to_paid, in_currency_id, in_type) returning id into p_id;

    insert into order1 (passenger_id, time_create, status, payment_id, end_trip_address_id) values (in_passenger_id, sysdate, 'search_driver', p_id, in_address_id) returning id into o_id;
    dbms_output.put_line(o_id);
    
    select length(addr) as leng 
    into lenght_in_address_id
    from (select in_address_id addr from dual);
    
    select substr(n, instr(n,',') - lenght_in_address_id) as  Со_второго_значения
    into in_massive_address_id_a
    from (select in_massive_address_id n from dual);
    dbms_output.put_line(in_massive_address_id||chr(10)||in_massive_address_id_a);
    v_a := apex_util.string_to_table(in_massive_address_id, ',');
    v_b := apex_util.string_to_table(in_massive_address_id_a, ',');
    v_c := apex_util.string_to_table(in_massive_distance, ',');
    forall i in 1..v_a.count 
    insert into mytable (from_address_id, to_address_id, order_id, preview_way_id, distance) values (v_a(i), v_b(i), o_id, (select max(id) from way), v_c(i));
    insert into way (from_address_id, to_address_id, order_id, distance) values (in_address_id, (select min(from_address_id) from mytable where order_id = o_id), o_id, (select min(distance) from mytable where order_id = o_id));
    
    for r in c_way loop
    if r.order_id = o_id then
        insert into way (from_address_id, to_address_id, order_id, preview_way_id, distance) values 
        ((select to_address_id from mytable where id = (select min(id) from mytable where order_id = o_id)), (select from_address_id from mytable where id = (select min(id) from mytable where order_id = o_id)),  o_id, 
        (select preview_way_id from mytable where id = (select min(id) from mytable where order_id = o_id)), (select distance from mytable where id = (select min(id) from mytable where order_id = o_id)));
        
        update way set preview_way_id = (select max(id) from way where order_id = o_id) - 1 where order_id = o_id and id = (select max(id) from way where order_id = o_id);
        delete from mytable where id = (select min(id) from mytable where order_id = o_id);
        update way set distance = (select distance from mytable where id = (select min(id) from mytable where order_id = o_id)) where order_id = o_id and id = (select max(id) from way where order_id = o_id);
        update way set to_address_id = (select from_address_id from mytable where id = (select min(id) from mytable where order_id = o_id)) where order_id = o_id and id = (select max(id) from way where order_id = o_id);
        delete from way where to_address_id is null and order_id = o_id;
    else 
        dbms_output.put_line('Нет записей');
    end if;
    end loop;
Commit;
end;

---------------------------------------------------------------------------------------------------------------------------------------

-- процедура обновления рейтинга пользователей
create or replace procedure update_passenger_rating (in_days integer)
as
    avg_rating integer;
    
    in_days_a date := sysdate;
    in_days_b date := in_days_a - in_days;

    cursor c_rating_driver2passenger
    is
     select passenger_id,
           round(avg(rating),2) as avg
    from rating_driver2passenger
    where time_create > in_days_b
    group by passenger_id;

begin    
    delete from passenger_rating;
    
    for r in c_rating_driver2passenger loop
    insert into passenger_rating (passenger_id, rating) values (r.passenger_id,r.avg);
    end loop;
Commit;
end;

---------------------------------------------------------------------------------------------------------------------------------------

-- процедура обновления рейтинга водителей
create or replace procedure update_driver_rating (in_days integer)
as
    avg_rating integer;
    
    in_days_a date := sysdate;
    in_days_b date := in_days_a - in_days;

    cursor c_rating_passenger2driver
    is
     select driver_id,
           round(avg(rating),2) as avg
    from rating_passenger2driver
    where time_create > in_days_b
    group by driver_id;

begin    
    delete from driver_rating;
    
    for r in c_rating_passenger2driver loop
    insert into driver_rating (driver_id, rating) values (r.driver_id,r.avg);
    end loop;
Commit;
end;