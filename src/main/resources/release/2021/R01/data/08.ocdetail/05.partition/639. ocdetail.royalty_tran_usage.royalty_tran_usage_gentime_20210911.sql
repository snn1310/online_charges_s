CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210911
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');
