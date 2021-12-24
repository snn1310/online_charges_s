CREATE TABLE ccdetail3.event_history_gentime_20210916
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

