CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20210101
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-12-01 00:00:00') TO ('2021-01-01 00:00:00');

