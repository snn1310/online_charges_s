CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20200101
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2019-12-01 00:00:00') TO ('2020-01-01 00:00:00');

