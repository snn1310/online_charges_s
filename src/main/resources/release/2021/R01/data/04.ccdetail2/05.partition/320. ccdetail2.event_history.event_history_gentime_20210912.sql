CREATE TABLE ccdetail2.event_history_gentime_20210912
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');

