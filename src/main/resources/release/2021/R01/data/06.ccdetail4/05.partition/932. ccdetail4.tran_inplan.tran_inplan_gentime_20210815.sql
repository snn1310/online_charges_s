CREATE TABLE ccdetail4.tran_inplan_gentime_20210815
        PARTITION OF ccdetail4.tran_inplan
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

