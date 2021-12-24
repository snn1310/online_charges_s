CREATE TABLE ccdetail1.event_history_gentime_20210911
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');

