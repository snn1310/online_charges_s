CREATE TABLE ccdetail2.discount_detail_gentime_20210926
        PARTITION OF ccdetail2.discount_detail
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

