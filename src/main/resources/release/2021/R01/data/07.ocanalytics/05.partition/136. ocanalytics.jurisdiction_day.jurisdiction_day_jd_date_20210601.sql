CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20210601
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2021-05-01 00:00:00') TO ('2021-06-01 00:00:00');

