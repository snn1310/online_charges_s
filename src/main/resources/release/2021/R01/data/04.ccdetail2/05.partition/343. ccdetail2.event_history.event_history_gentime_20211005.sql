CREATE TABLE ccdetail2.event_history_gentime_20211005
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');
