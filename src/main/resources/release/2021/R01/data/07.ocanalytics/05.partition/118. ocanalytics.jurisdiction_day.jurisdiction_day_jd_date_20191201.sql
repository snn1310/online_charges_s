CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20191201
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2019-11-01 00:00:00') TO ('2019-12-01 00:00:00');

