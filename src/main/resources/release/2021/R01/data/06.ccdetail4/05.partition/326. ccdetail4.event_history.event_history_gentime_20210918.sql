CREATE TABLE ccdetail4.event_history_gentime_20210918
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-09-17 00:00:00') TO ('2021-09-18 00:00:00');

