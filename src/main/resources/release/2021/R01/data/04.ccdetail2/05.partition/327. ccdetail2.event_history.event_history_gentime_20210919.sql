CREATE TABLE ccdetail2.event_history_gentime_20210919
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

