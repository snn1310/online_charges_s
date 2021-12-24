CREATE TABLE ccdetail4.jurisdiction_gentime_20211003
        PARTITION OF ccdetail4.jurisdiction
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

