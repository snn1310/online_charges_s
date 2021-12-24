CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20200801
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-07-01 00:00:00') TO ('2020-08-01 00:00:00');

