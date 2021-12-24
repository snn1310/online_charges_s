CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20201201
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-11-01 00:00:00') TO ('2020-12-01 00:00:00');

