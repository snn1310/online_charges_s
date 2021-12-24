CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20210301
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2021-02-01 00:00:00') TO ('2021-03-01 00:00:00');

