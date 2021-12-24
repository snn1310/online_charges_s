CREATE TABLE ccdetail1.event_history_gentime_20211016
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');

