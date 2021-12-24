CREATE TABLE ccdetail1.content_gentime_20210815
        PARTITION OF ccdetail1.content
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

