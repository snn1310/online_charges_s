CREATE TABLE ccdetail4.event_history_gentime_20211004
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

