CREATE TABLE ccdetail2.royalty_tran_usage_gentime_20210905
        PARTITION OF ccdetail2.royalty_tran_usage
        FOR VALUES FROM ('2021-09-04 00:00:00') TO ('2021-09-05 00:00:00');

