-- процедура расчёта зарплаты для каждого водителя в рублях
create or replace package report_salary_driver
is
    type report_rec is record (ИД_водителя number,
                               Имя_водителя varchar2(255),
                               Сумма_комиссии number);
    type report_tbl is table of report_rec;
    
    function salary_driver (p_start_period date,
                            p_end_period date) return report_tbl pipelined;
                            
end report_salary_driver;

create or replace package body report_salary_driver
is
    function salary_driver (p_start_period date,
                            p_end_period date) return report_tbl pipelined
    is
        v_report_row report_rec;
        
        cursor c_salary_driver
        is
                                select
                                        ИД_водителя,
                                        Имя_водителя,
                                        sum(Комиссия_водителя_в_руб) as Сумма_комиссии
                                    from (select
                                            percent_of_payment as Комиссия_водителя_в_проц,
                                            tab4.id as ИД_водителя,
                                            tab4.name as Имя_водителя,
                                            tab3.id as ИД_заказа_такси,
                                            to_date(to_char(tab3.time_create,'dd.mm.yyyy')) as Дата_заказа,
                                            amount_to_paid as Стоимость_заказа,
                                            tab1.средний_курс,
                                            round(tab2.amount_to_paid * tab4.percent_of_payment/100 * tab1.средний_курс,2) as Комиссия_водителя_в_руб
                                        from (select
                                                to_date(to_char(time_create,'dd.mm.yyyy')) as Период,
                                                currency1_id as Валюта_заказа,
                                                currency2_id as Валюта_обмена,
                                                avg(rate) as средний_курс
                                                from rate 
                                                group by currency1_id, currency2_id, to_date(to_char(time_create,'dd.mm.yyyy'))) tab1

                                                left join currency tab5 on  tab5.id = tab1.Валюта_обмена
                                                left join payment tab2 on tab2.currency_id = tab5.id
                                                left join order1 tab3 on tab3.payment_id = tab2.id
                                                left join driver tab4 on tab4.id = tab3.driver_id
                                                where tab3.status = 'trip_completed'
                                                and tab3.time_create between p_start_period and p_end_period
                                                group by percent_of_payment,tab4.id,tab4.name,tab3.id,to_date(to_char(tab3.time_create,'dd.mm.yyyy')),amount_to_paid,tab1.средний_курс)
                                                group by ИД_водителя,Имя_водителя;
                                                
begin
        for r in c_salary_driver loop
         v_report_row.ИД_водителя := r.ИД_водителя;
         v_report_row.Имя_водителя := r.Имя_водителя;
         v_report_row.Сумма_комиссии := r.Сумма_комиссии;
            pipe row (v_report_row);
        end loop;
        return;
end;

end report_salary_driver;