CREATE TABLE ccdetail4.event_history_gentime_20211013
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');

