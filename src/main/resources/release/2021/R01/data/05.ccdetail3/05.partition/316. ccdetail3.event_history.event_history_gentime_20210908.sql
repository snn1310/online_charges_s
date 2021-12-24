CREATE TABLE ccdetail3.event_history_gentime_20210908
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');

