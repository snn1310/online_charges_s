CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210921
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

