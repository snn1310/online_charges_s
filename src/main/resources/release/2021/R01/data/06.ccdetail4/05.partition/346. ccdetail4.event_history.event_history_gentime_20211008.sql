CREATE TABLE ccdetail4.event_history_gentime_20211008
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');
