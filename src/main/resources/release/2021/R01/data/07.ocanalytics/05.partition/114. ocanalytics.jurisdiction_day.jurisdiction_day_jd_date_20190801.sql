CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20190801
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2019-07-01 00:00:00') TO ('2019-08-01 00:00:00');

