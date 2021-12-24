CREATE TABLE ccdetail4.event_history_gentime_20211005
        PARTITION OF ccdetail4.event_history
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

