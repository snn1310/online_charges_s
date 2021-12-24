CREATE TABLE ccdetail3.event_history_gentime_20210926
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

