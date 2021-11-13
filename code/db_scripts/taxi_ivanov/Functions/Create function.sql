-- ��������� ������� �������� ��� ������� �������� � ������
create or replace package report_salary_driver
is
    type report_rec is record (��_�������� number,
                               ���_�������� varchar2(255),
                               �����_�������� number);
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
                                        ��_��������,
                                        ���_��������,
                                        sum(��������_��������_�_���) as �����_��������
                                    from (select
                                            percent_of_payment as ��������_��������_�_����,
                                            tab4.id as ��_��������,
                                            tab4.name as ���_��������,
                                            tab3.id as ��_������_�����,
                                            to_date(to_char(tab3.time_create,'dd.mm.yyyy')) as ����_������,
                                            amount_to_paid as ���������_������,
                                            tab1.�������_����,
                                            round(tab2.amount_to_paid * tab4.percent_of_payment/100 * tab1.�������_����,2) as ��������_��������_�_���
                                        from (select
                                                to_date(to_char(time_create,'dd.mm.yyyy')) as ������,
                                                currency1_id as ������_������,
                                                currency2_id as ������_������,
                                                avg(rate) as �������_����
                                                from rate 
                                                group by currency1_id, currency2_id, to_date(to_char(time_create,'dd.mm.yyyy'))) tab1

                                                left join currency tab5 on  tab5.id = tab1.������_������
                                                left join payment tab2 on tab2.currency_id = tab5.id
                                                left join order1 tab3 on tab3.payment_id = tab2.id
                                                left join driver tab4 on tab4.id = tab3.driver_id
                                                where tab3.status = 'trip_completed'
                                                and tab3.time_create between p_start_period and p_end_period
                                                group by percent_of_payment,tab4.id,tab4.name,tab3.id,to_date(to_char(tab3.time_create,'dd.mm.yyyy')),amount_to_paid,tab1.�������_����)
                                                group by ��_��������,���_��������;
                                                
begin
        for r in c_salary_driver loop
         v_report_row.��_�������� := r.��_��������;
         v_report_row.���_�������� := r.���_��������;
         v_report_row.�����_�������� := r.�����_��������;
            pipe row (v_report_row);
        end loop;
        return;
end;

end report_salary_driver;