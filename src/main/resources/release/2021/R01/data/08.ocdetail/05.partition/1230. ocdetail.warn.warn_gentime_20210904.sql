CREATE TABLE ocdetail.warn_gentime_20210904
        PARTITION OF ocdetail.warn
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');

