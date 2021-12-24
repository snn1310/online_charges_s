CREATE TABLE ccdetail2.content_gentime_20210815
        PARTITION OF ccdetail2.content
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

