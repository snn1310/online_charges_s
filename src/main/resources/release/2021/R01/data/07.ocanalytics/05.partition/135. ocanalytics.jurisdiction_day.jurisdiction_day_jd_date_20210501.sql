CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20210501
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2021-04-01 00:00:00') TO ('2021-05-01 00:00:00');

