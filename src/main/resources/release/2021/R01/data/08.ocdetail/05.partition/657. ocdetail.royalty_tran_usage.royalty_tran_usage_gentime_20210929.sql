CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210929
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');

