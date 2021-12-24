CREATE TABLE ccdetail3.event_history_gentime_20210924
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-23 00:00:00') TO ('2021-09-24 00:00:00');

