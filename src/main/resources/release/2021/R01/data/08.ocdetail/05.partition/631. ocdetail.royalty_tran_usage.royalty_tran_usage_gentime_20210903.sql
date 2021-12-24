CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210903
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');

