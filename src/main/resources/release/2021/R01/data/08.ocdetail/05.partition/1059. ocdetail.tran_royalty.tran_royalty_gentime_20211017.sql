CREATE TABLE ocdetail.tran_royalty_gentime_20211017
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

