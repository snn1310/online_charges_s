CREATE TABLE ccdetail1.event_history_gentime_20210922
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

