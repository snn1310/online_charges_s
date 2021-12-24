CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20190901
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2019-08-01 00:00:00') TO ('2019-09-01 00:00:00');

