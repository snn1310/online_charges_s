CREATE TABLE ccdetail4.customer_detail_gentime_20210815
        PARTITION OF ccdetail4.customer_detail
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');
