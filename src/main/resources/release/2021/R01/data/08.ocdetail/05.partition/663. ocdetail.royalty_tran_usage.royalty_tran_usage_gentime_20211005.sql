CREATE TABLE ocdetail.royalty_tran_usage_gentime_20211005
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

