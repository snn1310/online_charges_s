CREATE TABLE ccdetail2.event_history_gentime_20210829
        PARTITION OF ccdetail2.event_history
        FOR VALUES FROM (MINVALUE) TO ('2021-08-29 00:00:00');

