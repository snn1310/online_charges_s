CREATE TABLE ocdetail.tran_royalty_gentime_20210912
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');
