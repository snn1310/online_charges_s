CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210922
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

