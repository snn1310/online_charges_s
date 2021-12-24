CREATE TABLE ccdetail1.event_history_gentime_20210930
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

