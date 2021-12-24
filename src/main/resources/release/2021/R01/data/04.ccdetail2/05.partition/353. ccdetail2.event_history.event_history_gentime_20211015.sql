CREATE TABLE ccdetail2.event_history_gentime_20211015
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');

