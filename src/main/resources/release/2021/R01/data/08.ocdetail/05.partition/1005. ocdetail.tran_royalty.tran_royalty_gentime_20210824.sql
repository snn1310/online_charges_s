CREATE TABLE ocdetail.tran_royalty_gentime_20210824
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');

