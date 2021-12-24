CREATE TABLE ccdetail4.event_history_gentime_20210921
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-09-20 00:00:00') TO ('2021-09-21 00:00:00');

