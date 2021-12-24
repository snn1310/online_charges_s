CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20211201
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2021-11-01 00:00:00') TO ('2021-12-01 00:00:00');

