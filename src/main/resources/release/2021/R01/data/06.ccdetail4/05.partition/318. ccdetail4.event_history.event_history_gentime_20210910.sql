CREATE TABLE ccdetail4.event_history_gentime_20210910
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

