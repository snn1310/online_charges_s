CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20191101
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2019-10-01 00:00:00') TO ('2019-11-01 00:00:00');

