CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20201001
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-09-01 00:00:00') TO ('2020-10-01 00:00:00');

