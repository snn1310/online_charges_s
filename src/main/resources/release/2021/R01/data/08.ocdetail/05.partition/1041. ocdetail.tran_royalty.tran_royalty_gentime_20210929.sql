CREATE TABLE ocdetail.tran_royalty_gentime_20210929
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-09-28 00:00:00') TO ('2021-09-29 00:00:00');
