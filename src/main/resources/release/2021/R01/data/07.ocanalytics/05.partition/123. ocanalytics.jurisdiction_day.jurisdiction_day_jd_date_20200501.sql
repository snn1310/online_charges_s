CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20200501
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM ('2020-04-01 00:00:00') TO ('2020-05-01 00:00:00');

