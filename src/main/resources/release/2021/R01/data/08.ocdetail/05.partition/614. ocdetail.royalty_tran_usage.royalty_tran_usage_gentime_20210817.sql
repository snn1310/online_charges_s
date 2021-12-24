CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210817
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-08-16 00:00:00') TO ('2021-08-17 00:00:00');

