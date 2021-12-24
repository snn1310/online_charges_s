CREATE TABLE ccdetail1.event_history_gentime_20210903
        PARTITION OF ccdetail1.event_history
        FOR VALUES FROM ('2021-09-02 00:00:00') TO ('2021-09-03 00:00:00');

