CREATE TABLE ccdetail2.event_history_gentime_20211017
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-10-16 00:00:00') TO ('2021-10-17 00:00:00');

