CREATE TABLE ccdetail2.event_history_gentime_20210916
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

