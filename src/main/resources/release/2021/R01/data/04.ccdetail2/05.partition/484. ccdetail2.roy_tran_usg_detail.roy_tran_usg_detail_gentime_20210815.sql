CREATE TABLE ccdetail2.roy_tran_usg_detail_gentime_20210815
        PARTITION OF ccdetail2.roy_tran_usg_detail
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

