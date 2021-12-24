CREATE TABLE ccdetail3.event_history_gentime_20210920
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');

