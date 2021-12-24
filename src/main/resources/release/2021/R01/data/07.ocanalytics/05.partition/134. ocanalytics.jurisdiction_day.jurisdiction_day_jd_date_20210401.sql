CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20210401
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2021-03-01 00:00:00') TO ('2021-04-01 00:00:00');

