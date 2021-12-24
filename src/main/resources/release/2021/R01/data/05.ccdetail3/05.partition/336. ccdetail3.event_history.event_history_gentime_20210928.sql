CREATE TABLE ccdetail3.event_history_gentime_20210928
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');

