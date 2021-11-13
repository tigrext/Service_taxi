insert into country (name) values ('Russia');
insert into country (name) values ('USA');
insert into country (name) values ('Canada');
insert into country (name) values ('Belgia');
insert into country (name) values ('Egypt');
insert into country (name) values ('Belarus');
insert into country (name) values ('Turkey');
insert into country (name) values ('Poland');
insert into country (name) values ('Kazahstan');
insert into country (name) values ('Armenia');


insert into city (name, country_id) values ('Moscow', '1');
insert into city (name, country_id) values ('Sochi', '1');
insert into city (name, country_id) values ('New-York', '2');
insert into city (name, country_id) values ('Hurgada', '5');
insert into city (name, country_id) values ('Istanbul', '7');
insert into city (name, country_id) values ('Razdan', '10');
insert into city (name, country_id) values ('Varshava', '8');
insert into city (name, country_id) values ('Lublin', '8');
insert into city (name, country_id) values ('Brussel', '4');
insert into city (name, country_id) values ('Edmont', '3');
insert into city (name, country_id) values ('Sankt Petersburg', '1');


insert into street (name, city_id) values ('Bulvar Acadimica Landau', '1');
insert into street (name, city_id) values ('Kremlevskaya', '1');
insert into street (name, city_id) values ('Moscworeckaya', '1');
insert into street (name, city_id) values ('Maroseyka', '1');
insert into street (name, city_id) values ('Novomarinskaya', '1');
insert into street (name, city_id) values ('Rose', '2');
insert into street (name, city_id) values ('Sovetskaya', '2');
insert into street (name, city_id) values ('Voykova', '2');
insert into street (name, city_id) values ('Egorova', '2');
insert into street (name, city_id) values ('Chaikovskiy', '2');
insert into street (name, city_id) values ('Canal St', '3');
insert into street (name, city_id) values ('Admiralteyskaya', '11');
insert into street (name, city_id) values ('Engenernaya', '11');
insert into street (name, city_id) values ('Clenova', '11');
insert into street (name, city_id) values ('Chambers', '3');
insert into street (name, city_id) values ('Franklin', '3');
insert into street (name, city_id) values ('Backster', '3');
insert into street (name, city_id) values ('Green', '3');
insert into street (name, city_id) values ('Mercer', '3');
insert into street (name, city_id) values ('Sheri', '4');
insert into street (name, city_id) values ('Abu', '4');
insert into street (name, city_id) values ('Sheraton', '4');
insert into street (name, city_id) values ('Alkauhter', '4');
insert into street (name, city_id) values ('Savfeti', '5');
insert into street (name, city_id) values ('Ebus Suud', '5');
insert into street (name, city_id) values ('Jaferie', '5');
insert into street (name, city_id) values ('Ischapasha', '5');
insert into street (name, city_id) values ('Spandarian', '6');
insert into street (name, city_id) values ('Shinararner', '6');
insert into street (name, city_id) values ('Raffi', '6');
insert into street (name, city_id) values ('Hadjan', '6');
insert into street (name, city_id) values ('Rozbrat', '7');
insert into street (name, city_id) values ('Vilcha', '7');
insert into street (name, city_id) values ('Yazduv', '7');
insert into street (name, city_id) values ('Juravaya', '7');
insert into street (name, city_id) values ('Ezuitskaya', '8');
insert into street (name, city_id) values ('Zamkova', '8');
insert into street (name, city_id) values ('Podvale', '8');
insert into street (name, city_id) values ('Vesola', '8');
insert into street (name, city_id) values ('Plattesteen', '9');
insert into street (name, city_id) values ('Zuidstraat', '9');
insert into street (name, city_id) values ('Anspah', '9');
insert into street (name, city_id) values ('Solvayplein', '9');
insert into street (name, city_id) values ('Chausee', '10');
insert into street (name, city_id) values ('Mahatma Gandhi', '10');
insert into street (name, city_id) values ('Rue Osseghem', '10');
insert into street (name, city_id) values ('Rue Jules Delhaize', '10');


declare
    i number := 0;
begin  
    while i < 47 loop
        i :=  i + 1;
        INSERT INTO address (house_number, street_id) Values ('1', i);
        INSERT INTO address (house_number, street_id) Values ('2', i);
        INSERT INTO address (house_number, street_id) Values ('3', i);
        INSERT INTO address (house_number, street_id) Values ('4', i);
        INSERT INTO address (house_number, street_id) Values ('5', i);
        INSERT INTO address (house_number, street_id) Values ('6', i);
        INSERT INTO address (house_number, street_id) Values ('7', i);
        INSERT INTO address (house_number, street_id) Values ('8', i);
        INSERT INTO address (house_number, street_id) Values ('9', i);
        INSERT INTO address (house_number, street_id) Values ('10', i);
        INSERT INTO address (house_number, street_id) Values ('11', i);
        INSERT INTO address (house_number, street_id) Values ('12', i);
        INSERT INTO address (house_number, street_id) Values ('13', i);
        INSERT INTO address (house_number, street_id) Values ('14', i);
        INSERT INTO address (house_number, street_id) Values ('15', i);
        dbms_output.put_line(i);        
    end loop;   
end;


insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('0', 'Ivanov Nikita Borisovich', '25', '1', '89153862440', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Kokorev Dmitriy Vladimirovich', '32', '25', '89153352243', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('0', 'Fomichev Alexander Perovich', '24', '47', '89153862368', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('0', 'Pushkina Valeriya Georgievna', '19', '4', '89134862440', '0');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Kovalev Dmitriy Semenovich', '34', '94', '89154965440', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('0', 'Grishina Anna Dmitrievna', '27', '148', '89345762540', '0');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('0', 'Frolov Pavel Pavlovich', '56', '193', '89153863440', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Moschina Ekaterina Victorovna', '43', '358', '89153542496', '0');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Koneva Elizaveta Ivanovna', '22', '63', '89153869234', '0');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Pupkin Aleksey Sergeevich', '37', '548', '89132359233', '1');
insert into passenger (is_anonymous, name, age, home_address_id, phone_number, is_male) values ('1', 'Filova Ekaterina Borisovna', '68', '396', '89153243223', '0');


insert into parking (numb, address_id, city_id) values ('1', '357', '7');
insert into parking (numb, address_id, city_id) values ('2', '124', '1');
insert into parking (numb, address_id, city_id) values ('3', '2', '1');
insert into parking (numb, address_id, city_id) values ('4', '456', '10');
insert into parking (numb, address_id, city_id) values ('5', '700', '3');
insert into parking (numb, address_id, city_id) values ('6', '648', '3');
insert into parking (numb, address_id, city_id) values ('7', '572', '8');
insert into parking (numb, address_id, city_id) values ('8', '458', '10');
insert into parking (numb, address_id, city_id) values ('9', '222', '2');
insert into parking (numb, address_id, city_id) values ('10', '184', '1');
insert into parking (numb, address_id, city_id) values ('11', '610', '4');
insert into parking (numb, address_id, city_id) values ('12', '583', '8');
insert into parking (numb, address_id, city_id) values ('13', '349', '7');
insert into parking (numb, address_id, city_id) values ('14', '7', '1');
insert into parking (numb, address_id, city_id) values ('15', '99', '1');


insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Toyota', 'Camry', 'Black', '1', 'с423со_197', '1', '400');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Hundai', 'Solaris', 'Yellow', '1', 'с123пи_195', '2', '15300');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Ford', 'Focus', 'White', '1', 'к513вл_50', '3', '26000');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Kia', 'Rio', 'Yellow', '1', 'с453со_197', '4', '53954');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Kia', 'Ceed', 'Blue', '1', 'с953тм_193', '5', '94024');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Lada', 'Vesta', 'Black', '1', 'с356пг_195', '6', '5360');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Kia', 'Optima', 'White', '1', 'т457цр_80', '7', '140684');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Volkswagen', 'Passat', 'Grey', '1', 'р975юк_25', '8', '14964');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Toyota', 'Corolla', 'Black', '1', 'с247кн_183', '17', '95730');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Hundai', 'Creta', 'Red', '1', 'у793шл_195', '18', '43869');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Toyota', 'Camry', 'Black', '1', 'д357бу_197', '19', '120450');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Hundai', 'Solaris', 'Yellow', '1', 'л174фр_197', '20', '185920');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Kia', 'Rio', 'Black', '1', 'в586ры_193', '21', '49645');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Toyota', 'Camry', 'Green', '0', 'с962пл_192', '22', '32000');
insert into car (brand, model, color, is_reserved, state_number, parking_id, mileage) values ('Hundai', 'Solaris', 'Blue', '0', 'с666пи_195', '16', '73346');


insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Петров Стефан Александрович', '32', '89234862958', '60', to_date('2020.04.02', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Петухов Зиновий Филатович', '25', '89102965584', '60', to_date('2020.03.30', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Зайцев Игнатий Данилович', '27', '86508453711', '70', to_date('2021.02.20', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Харитонов Владимир Егорович', '48', '83550410120', '65', to_date('2019.05.10', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Комиссаров Парамон Леонидович', '46', '83320878324', '60', to_date('2018.06.08', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Казаков Владимир Андреевич', '35', '83339600843', '65', to_date('2020.07.04', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Орлов Гаянэ Аркадьевич', '36', '89481494538', '60', to_date('2020.08.16', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Гришин Рудольф Иосифович', '27', '85873716199', '65', to_date('2021.09.17', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Быков Савелий Игнатьевич', '29', '83813808247', '60', to_date('2020.10.12', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Крюков Мирон Максович', '53', '82912375151', '60', to_date('2021.11.27', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Бобылёв Антон Антонинович', '45', '83474194047', '65', to_date('2021.12.28', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Кононов Арсений Давидович', '47', '85185909782', '60', to_date('2021.01.23', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Меркушев Велорий Владиславович', '29', '89597112216', '60', to_date('2020.02.29', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Селиверстов Лев Онисимович', '30', '88087491297', '70', to_date('2018.03.12', 'yyyy-mm-dd'));
insert into driver (name, age, phone_number, percent_of_payment, registration_date) values ('Федосеев Константин Аристархович', '32', '87328396656', '70', to_date('2019.04.21', 'yyyy-mm-dd'));

insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('1', '1', to_date('2021.12.24', 'yyyy-mm-dd'), '9', '400');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('2', '2', to_date('2021.03.12', 'yyyy-mm-dd'), '8', '12500');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('3', '17', to_date('2021.03.05', 'yyyy-mm-dd'), '7', '23000');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('4', '18', to_date('2020.08.05', 'yyyy-mm-dd'),'12', '34509');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('5', '19', to_date('2019.04.02', 'yyyy-mm-dd'), '11', '25468');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('6', '20', to_date('2020.05.29', 'yyyy-mm-dd'), '12', '24678');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('7', '21', to_date('2019.06.23', 'yyyy-mm-dd'), '13', '74325');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('8', '29', to_date('2021.09.17', 'yyyy-mm-dd'), '10', '46008');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('9', '32', to_date('2019.08.18', 'yyyy-mm-dd'), '9', '14685');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('10', '33', to_date('2019.01.13', 'yyyy-mm-dd'), '11', '40250');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('11', '34', to_date('2020.01.18', 'yyyy-mm-dd'), '10', '25797');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('12', '35', to_date('2019.05.25', 'yyyy-mm-dd'), '10', '24690');
insert into rent (driver_id, car_id, date_start, gas_mileage, distance) values ('14', '36', to_date('2019.07.22', 'yyyy-mm-dd'), '10', '1200');
insert into rent (driver_id, car_id, date_start, date_stop, gas_mileage, distance) values ('15', '37', to_date('2019.04.21', 'yyyy-mm-dd'), to_date('2021.01.01', 'yyyy-mm-dd'), '10', '38000');

insert into currency (name, abbreviation) values ('Рубль', 'RUB');
insert into currency (name, abbreviation) values ('Доллар', 'USD');
insert into currency (name, abbreviation) values ('Евро', 'EUR');
insert into currency (name, abbreviation) values ('Канадский доллар', 'CAD');
insert into currency (name, abbreviation) values ('Египетский фунт', 'EGP');
insert into currency (name, abbreviation) values ('Белорусский рубль', 'BYN');
insert into currency (name, abbreviation) values ('Турецкая лира', 'TRY');
insert into currency (name, abbreviation) values ('Польский злотый', 'PLN');
insert into currency (name, abbreviation) values ('Казахстанский тенге', 'KZT');
insert into currency (name, abbreviation) values ('Армянский драм', 'AMD');


insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '1', to_date('2021.08.13', 'yyyy-mm-dd'), '1');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '2', to_date('2021.08.13', 'yyyy-mm-dd'), '75');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '3', to_date('2021.08.13', 'yyyy-mm-dd'), '90');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '21', to_date('2021.08.13', 'yyyy-mm-dd'), '58');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '22', to_date('2021.08.13', 'yyyy-mm-dd'), '5');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '23', to_date('2021.08.13', 'yyyy-mm-dd'), '29');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '24', to_date('2021.08.13', 'yyyy-mm-dd'), '9');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '25', to_date('2021.08.13', 'yyyy-mm-dd'), '19');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '26', to_date('2021.08.13', 'yyyy-mm-dd'), '1');
insert into rate (currency1_id, currency2_id, time_create, rate) values ('1', '27', to_date('2021.08.13', 'yyyy-mm-dd'), '1');


insert into currency2country (currency_id, counry_id) values ('1', '1');
insert into currency2country (currency_id, counry_id) values ('2', '2');
insert into currency2country (currency_id, counry_id) values ('3', '3');
insert into currency2country (currency_id, counry_id) values ('21', '4');
insert into currency2country (currency_id, counry_id) values ('22', '5');
insert into currency2country (currency_id, counry_id) values ('23', '6');
insert into currency2country (currency_id, counry_id) values ('24', '7');
insert into currency2country (currency_id, counry_id) values ('25', '8');
insert into currency2country (currency_id, counry_id) values ('26', '9');
insert into currency2country (currency_id, counry_id) values ('27', '10');


insert into payment (amount_to_paid, currency_id, type) values ('500', '1', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('2000', '1', 'cash');
insert into payment (amount_to_paid, currency_id, type) values ('58', '2', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('47', '3', 'cash');
insert into payment (amount_to_paid, currency_id, type) values ('39', '21', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('389', '22', 'cash');
insert into payment (amount_to_paid, currency_id, type) values ('2400', '23', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('1405', '24', 'cash');
insert into payment (amount_to_paid, currency_id, type) values ('1408', '25', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('1247', '26', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('3500', '27', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('200', '1', 'card');
insert into payment (amount_to_paid, currency_id, type) values ('200', '1', 'card');


insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('1', '1', to_date('2020.07.22 16:20:05','yyyy-mm-dd hh24:mi:ss'), to_date('2020.07.22 17:20:05','yyyy-mm-dd hh24:mi:ss'), 'trip_completed', '14', '4', '78');
insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('2', '2', to_date('2021.03.22 12:20:05','yyyy-mm-dd hh24:mi:ss'), to_date('2021.03.22 13:11:26','yyyy-mm-dd hh24:mi:ss'), 'trip_completed', '15', '205', '100,1');
insert into order1 (passenger_id, time_create, status, payment_id, end_trip_address_id) values ('1', to_date('2020.07.22 16:20:05','yyyy-mm-dd hh24:mi:ss'), 'search_driver', '16', '300');
insert into order1 (passenger_id, driver_id, time_create, status, payment_id, end_trip_address_id, average_driver_speed) values ('3', '3', to_date('2021.08.13 13:05:32','yyyy-mm-dd hh24:mi:ss'), 'wait_driver', '17', '465', '74,2');
insert into order1 (passenger_id, driver_id, time_create, status, payment_id, end_trip_address_id, average_driver_speed) values ('4', '4', to_date('2021.08.13 12:12:12','yyyy-mm-dd hh24:mi:ss'), 'wait_passenger', '18', '579', '85,4');
insert into order1 (passenger_id, driver_id, time_create, status, payment_id, end_trip_address_id, average_driver_speed) values ('5', '5', to_date('2021.08.13 17:34:54','yyyy-mm-dd hh24:mi:ss'), 'trip_started', '19', '702', '88,2');
insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('1', '6', to_date('2021.08.13 18:35:24','yyyy-mm-dd hh24:mi:ss'), to_date('2021.08.13 19:34:25','yyyy-mm-dd hh24:mi:ss'), 'wait_payment', '20', '642', '83,9');
insert into order1 (passenger_id, driver_id, time_create, status, payment_id, end_trip_address_id, average_driver_speed) values ('6', '7', to_date('2021.08.13 22:10:38','yyyy-mm-dd hh24:mi:ss'), 'trip_started', '21', '529', '62,7');
insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('7', '8', to_date('2020.11.13 17:43:47','yyyy-mm-dd hh24:mi:ss'), to_date('2020.11.13 18:18:32','yyyy-mm-dd hh24:mi:ss'), 'trip_completed', '22', '369', '69,9');
insert into order1 (passenger_id, time_create, status, payment_id) values ('9', to_date('2021.02.09 01:48:57','yyyy-mm-dd hh24:mi:ss'), 'canceled', '23');
insert into order1 (passenger_id, driver_id, time_create, status, payment_id) values ('9', '10', to_date('2020.03.15 08:53:59','yyyy-mm-dd hh24:mi:ss'),'canceled', '24');
insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('4', '9', to_date('2021.09.18 16:20:05','yyyy-mm-dd hh24:mi:ss'), to_date('2021.09.18 17:20:05','yyyy-mm-dd hh24:mi:ss'), 'trip_completed', '621', '4', '78');
insert into order1 (passenger_id, driver_id, time_create, time_end, status, payment_id, end_trip_address_id, average_driver_speed) values ('4', '9', to_date('2021.09.18 16:20:05','yyyy-mm-dd hh24:mi:ss'), to_date('2021.09.18 17:20:05','yyyy-mm-dd hh24:mi:ss'), 'trip_completed', '622', '4', '78');


insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('1', '1', to_date('2020.07.20 17:25:59','yyyy-mm-dd hh24:mi:ss'), '33', '5');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('2', '2', to_date('2020.03.21 13:14:20','yyyy-mm-dd hh24:mi:ss'), '34', '4');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('7', '8', to_date('2020.11.20 18:20:13','yyyy-mm-dd hh24:mi:ss'), '41', '3');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('1', '7', to_date('2020.07.20 17:25:59','yyyy-mm-dd hh24:mi:ss'), '33', '5');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('4', '6', to_date('2020.03.21 13:14:20','yyyy-mm-dd hh24:mi:ss'), '34', '4');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('8', '5', to_date('2020.11.20 18:20:13','yyyy-mm-dd hh24:mi:ss'), '41', '4');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('6', '17', to_date('2020.07.20 17:25:59','yyyy-mm-dd hh24:mi:ss'), '582', '5');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('8', '14', to_date('2020.03.21 13:14:20','yyyy-mm-dd hh24:mi:ss'), '583', '4');
insert into rating_passenger2driver (passenger_id, driver_id, time_create, order_id, rating) values ('9', '15', to_date('2020.11.20 18:20:13','yyyy-mm-dd hh24:mi:ss'), '584', '4');


insert into way (from_address_id, to_address_id, distance, order_id) values ('1', '25', '8', '33');
insert into way (from_address_id, to_address_id, distance, order_id) values ('68', '82', '18', '34');
insert into way (from_address_id, to_address_id, distance, order_id) values ('83', '112', '17', '35');
insert into way (from_address_id, to_address_id, distance, order_id) values ('168', '230', '25', '36');
insert into way (from_address_id, to_address_id, distance, order_id) values ('193', '212', '23', '37');
insert into way (from_address_id, to_address_id, distance, order_id) values ('260', '303', '28', '38');
insert into way (from_address_id, to_address_id, distance, order_id, preview_way_id) values ('25', '12', '12', '39', '7');
insert into way (from_address_id, to_address_id, distance, order_id, preview_way_id) values ('82', '54', '23', '40', '8');
insert into way (from_address_id, to_address_id, distance, order_id, preview_way_id) values ('112', '132', '19', '41', '9');
insert into way (from_address_id, to_address_id, distance, order_id, preview_way_id) values ('230', '203', '6', '42', '10');
insert into way (from_address_id, to_address_id, distance, order_id, preview_way_id) values ('303', '284', '14', '43', '11');
insert into way (from_address_id, to_address_id, distance, order_id) values ('2', '25', '10', '721');
insert into way (from_address_id, to_address_id, distance, order_id) values ('167', '25', '10', '722');


insert into rating_driver2passenger (passenger_id, driver_id, time_create, order_id, rating) values ('1', '1', to_date('2020.07.20 17:25:59','yyyy-mm-dd hh24:mi:ss'), '33', '5');
insert into rating_driver2passenger (passenger_id, driver_id, time_create, order_id, rating) values ('2', '2', to_date('2020.03.21 13:14:20','yyyy-mm-dd hh24:mi:ss'), '34', '3');
insert into rating_driver2passenger (passenger_id, driver_id, time_create, order_id, rating) values ('7', '8', to_date('2020.11.20 18:20:13','yyyy-mm-dd hh24:mi:ss'), '41', '2');


insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('1', '1', to_date('2021.02.12 14:23:59','yyyy-mm-dd hh24:mi:ss'), '14', '19');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('2', '2', to_date('2020.08.12 18:25:59','yyyy-mm-dd hh24:mi:ss'), '15', '65');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('3', '3', to_date('2020.09.30 01:25:59','yyyy-mm-dd hh24:mi:ss'), '16', '56');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('4', '17', to_date('2020.05.01 14:25:59','yyyy-mm-dd hh24:mi:ss'), '17', '43');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('5', '18', to_date('2020.04.04 12:25:59','yyyy-mm-dd hh24:mi:ss'), '18', '38');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('6', '19', to_date('2020.03.05 13:25:59','yyyy-mm-dd hh24:mi:ss'), '19', '48');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('7', '20', to_date('2020.02.12 7:25:59','yyyy-mm-dd hh24:mi:ss'), '20', '36');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('8', '21', to_date('2020.01.17 8:25:59','yyyy-mm-dd hh24:mi:ss'), '21', '49');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('9', '29', to_date('2020.12.15 9:25:59','yyyy-mm-dd hh24:mi:ss'), '22', '50');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('10', '32', to_date('2020.11.27 10:25:59','yyyy-mm-dd hh24:mi:ss'), '23', '53');
insert into refueling (driver_id, car_id, time_create, payment_id, amount_of_gasoline) values ('11', '33', to_date('2020.09.29 11:25:59','yyyy-mm-dd hh24:mi:ss'), '24', '43');


insert into passenger_rating (passenger_id, rating) values ('1', '5');
insert into passenger_rating (passenger_id, rating) values ('2', '3');
insert into passenger_rating (passenger_id, rating) values ('7', '2');


insert into driver_rating (driver_id, rating) values ('6', '4');
insert into driver_rating (driver_id, rating) values ('3', '5');
insert into driver_rating (driver_id, rating) values ('10', '5');
insert into driver_rating (driver_id, rating) values ('11', '4');
insert into driver_rating (driver_id, rating) values ('5', '3');
insert into driver_rating (driver_id, rating) values ('14', '5');
