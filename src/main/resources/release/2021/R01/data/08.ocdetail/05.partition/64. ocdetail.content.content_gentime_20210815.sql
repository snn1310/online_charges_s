CREATE TABLE ocdetail.content_gentime_20210815
        PARTITION OF ocdetail.content
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

