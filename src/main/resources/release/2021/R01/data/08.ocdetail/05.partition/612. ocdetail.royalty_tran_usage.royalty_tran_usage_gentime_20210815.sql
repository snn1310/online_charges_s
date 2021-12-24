CREATE TABLE ocdetail.royalty_tran_usage_gentime_20210815
        PARTITION OF ocdetail.royalty_tran_usage
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

