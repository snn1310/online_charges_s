CREATE TABLE ccdetail1.event_history_gentime_20211012
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');

