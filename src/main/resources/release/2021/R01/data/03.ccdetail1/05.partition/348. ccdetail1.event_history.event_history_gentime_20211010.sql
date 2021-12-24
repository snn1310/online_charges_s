CREATE TABLE ccdetail1.event_history_gentime_20211010
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

