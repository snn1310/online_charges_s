CREATE TABLE ccdetail2.event_history_gentime_20211006
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

