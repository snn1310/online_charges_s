CREATE TABLE ccdetail2.event_history_gentime_20210927
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

