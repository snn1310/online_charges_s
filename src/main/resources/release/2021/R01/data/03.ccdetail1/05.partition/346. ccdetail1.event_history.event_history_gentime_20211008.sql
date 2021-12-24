CREATE TABLE ccdetail1.event_history_gentime_20211008
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

