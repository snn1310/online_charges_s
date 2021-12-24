CREATE TABLE ccdetail3.event_history_gentime_20211002
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

