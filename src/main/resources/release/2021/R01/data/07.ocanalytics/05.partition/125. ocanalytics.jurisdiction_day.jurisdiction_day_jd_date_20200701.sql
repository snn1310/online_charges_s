CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20200701
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-06-01 00:00:00') TO ('2020-07-01 00:00:00');

