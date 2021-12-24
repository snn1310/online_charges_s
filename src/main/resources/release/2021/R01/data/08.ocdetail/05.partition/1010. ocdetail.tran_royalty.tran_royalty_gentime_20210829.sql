CREATE TABLE ocdetail.tran_royalty_gentime_20210829
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-08-28 00:00:00') TO ('2021-08-29 00:00:00');

