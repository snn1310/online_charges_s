CREATE TABLE ccdetail3.discount_detail_gentime_20210815
        PARTITION OF ccdetail3.discount_detail
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

