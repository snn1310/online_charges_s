CREATE TABLE ocdetail.warn_gentime_20210914
        PARTITION OF ocdetail.warn
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');

