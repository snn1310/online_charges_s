CREATE TABLE ccdetail1.royalty_tran_usage_gentime_20210913
        PARTITION OF ccdetail1.royalty_tran_usage
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');

