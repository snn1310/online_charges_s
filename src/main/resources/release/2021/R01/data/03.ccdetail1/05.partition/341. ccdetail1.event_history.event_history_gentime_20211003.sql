CREATE TABLE ccdetail1.event_history_gentime_20211003
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

