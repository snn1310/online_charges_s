CREATE TABLE ocdetail.royalty_tran_usage_gentime_20211009
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

