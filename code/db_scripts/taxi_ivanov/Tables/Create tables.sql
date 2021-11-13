create table passenger_image (id integer generated as identity not null,
                              passenger_id int,
                              image CLOB,
		        time_create_column timestamp,
                              primary key (id),
                              foreign key (passenger_id) references passenger(id));
                              
create table passenger_rating (id integer generated as identity not null,
                               passenger_id int,
                               rating decimal(3,2),
		         time_create timestamp,
                               primary key (id),
                               foreign key (passenger_id) references passenger(id));              
                    
create table country (id integer generated as identity not null,
                      name varchar(255) not null
                      primary key (id));
                              
create table city (id integer generated as identity not null,
                   name varchar(255) not null,
                   country_id integer not null
                   primary key (id),
                   foreign key (country_id) references country(id));

create table street (id integer generated as identity not null,
                     name varchar(255) not null,
                     city_id integer not null
                     primary key (id),
                     foreign key (city_id) references city(id));
                     
create table address (id integer generated as identity not null,
                      house_number integer not null,
                      street_id integer not null
                      primary key (id),
                      foreign key (street_id) references street(id));
                              
create table passenger (id integer generated as identity not null,
                        is_anonymous number(1) check (is_anonymous in (0,1)) not null,
                        name varchar(255),
                        age integer,
                        home_address_id integer,
                        phone_number varchar(50) not null,
                        is_male number(1) check (is_male in (0,1))
                        primary key (id),
                        foreign key (home_address_id) references address(id));

create table parking (id integer generated as identity not null,
                      numb int not null unique,
                      address_id int not null,
                      city_id int not null unique
                      primary key (id),
                      foreign key (address_id) references address(id),
                      foreign key (city_id) references city(id));
                      
create table currency (id integer generated as identity not null,
                       name varchar(50) not null,
                       abbreviation varchar(8) not null
                       primary key (id));  
                      
create table rate (id int generated as identity not null,
                   currency1_id int not null,
                   currency2_id int not null,
                   time_create timestamp not null,
                   rate decimal not null,
	        time_create timestamp,
                   primary key (id),
                   foreign key (currency1_id) references currency(id),
                   foreign key (currency2_id) references currency(id));

create table currency2country (currency_id int not null,
                               counry_id int not null
                               foreign key (currency_id) references currency(id),
                               foreign key (counry_id) references country(id));

create table payment (id int generated as identity not null,
                      amount_to_paid decimal not null,
                      currency_id int not null,
                      type varchar2(10) check ( type in('card', 'cash')) not null
                      primary key (id),
                      foreign key (currency_id) references currency(id));

create table driver (id int generated as identity not null,
                     name varchar(255) not null,
                     age int not null,
                     phone_number varchar2(50) not null,
                     percent_of_payment decimal not null,
                     registration_date date
                     primary key (id));

create table order1 (id int generated as identity not null,
                    passenger_id int not null,
                    driver_id int,
                    time_create timestamp not null,
                    time_end timestamp,
                    status varchar2(30) check (status in ('search_driver', 'wait_driver', 'wait_passenger', 'trip_started', 'wait_payment', 'trip_completed', 'canceled')) not null,
                    payment_id int not null,
                    end_trip_address_id int,
                    everage_driver_speed decimal(5,2)
                    primary key (id),
                    foreign key (passenger_id) references passenger(id),
                    foreign key (payment_id) references payment(id),
                    foreign key (end_trip_address_id) references address(id),
                    foreign key (driver_id) references driver(id));

create table rating_driver2passenger (id int generated as identity not null,
                                      passenger_id int not null,
                                      driver_id int not null,
                                      time_create timestamp not null,
                                      order_id int not null,
                                      rating decimal check (rating in (1, 2, 3, 4, 5)),
			     time_create timestamp,
                                      primary key (id),
                                      foreign key (passenger_id) references passenger(id),
                                      foreign key (driver_id) references driver(id),
                                      foreign key (order_id) references order1(id)); 

create table rating_passenger2driver (id int generated as identity not null,
                                      passenger_id int not null,
                                      driver_id int not null,
                                      time_create timestamp not null,
                                      order_id int not null,
                                      rating decimal check (rating in (1, 2, 3, 4, 5))
                                      primary key (id),
                                      foreign key (passenger_id) references passenger(id),
                                      foreign key (driver_id) references driver(id),
                                      foreign key (order_id) references order1(id)); 

-- таблица для процедуры
create table mytable (id integer generated as identity not null,
                      from_address_id int not null,
                      to_address_id int not null,
                      order_id int not null,
                      preview_way_id int,
                      distance decimal (10,2) not null,
		time_create timestamp,
                      primary key (id));
                                      
create table way (id int generated as identity not null,
                  from_address_id int not null,
                  to_address_id int,
                  distance decimal (10,2) not null,
                  order_id int not null,
                  preview_way_id int
                  primary key (id),
                  foreign key (from_address_id) references address(id),
                  foreign key (to_address_id) references address(id),
                  foreign key (order_id) references order1(id),
                  foreign key (preview_way_id) references way(id)); 

create table car (id int generated as identity not null,
                  brand varchar(50) not null,
                  model varchar(50) not null,
                  color varchar(50) check (color in ('White', 'Black', 'Grey', 'Red', 'Blue', 'Yellow', 'Green')) not null,
                  is_reserved number(1) check (is_reserved in (0,1)),
                  state_number varchar(50) not null unique,
                  parking_id int not null,
                  mileage number not null
                  primary key (id),
                  foreign key (parking_id) references parking(id));

create table refueling (id int generated as identity not null,
                  driver_id int not null,
                  car_id int not null,
                  time_create timestamp not null,
                  payment_id int not null,
                  amount_of_gasoline decimal not null
                  primary key (id),
                  foreign key (driver_id) references driver(id),
                  foreign key (car_id) references car(id),
                  foreign key (payment_id) references payment(id));                  

create table rent (id int generated as identity not null,
                  driver_id int not null,
                  car_id int not null,
                  date_start date not null,
                  date_stop date,
                  gas_mileage decimal,
                  distance number
                  primary key (id),
                  foreign key (driver_id) references driver(id),
                  foreign key (car_id) references car(id));

create table driver_image (id integer generated as identity not null,
                              driver_id int,
                              image CLOB
                              primary key (id),
                              foreign key (driver_id) references driver(id));
                              
create table driver_rating (id integer generated as identity not null,
                               driver_id int,
                               rating decimal(3,2),
                               primary key (id),
                               foreign key (driver_id) references driver(id));  