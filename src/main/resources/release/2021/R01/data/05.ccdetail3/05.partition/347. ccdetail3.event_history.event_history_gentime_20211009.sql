CREATE TABLE ccdetail3.event_history_gentime_20211009
        PARTITION OF ccdetail3.event_history
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

