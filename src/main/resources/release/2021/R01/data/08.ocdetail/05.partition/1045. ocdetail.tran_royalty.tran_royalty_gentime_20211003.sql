CREATE TABLE ocdetail.tran_royalty_gentime_20211003
        PARTITION OF ocdetail.tran_royalty
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

