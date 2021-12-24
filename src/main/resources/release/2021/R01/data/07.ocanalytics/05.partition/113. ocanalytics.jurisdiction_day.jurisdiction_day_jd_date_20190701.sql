CREATE TABLE ocanalytics.jurisdiction_day_jd_date_20190701
        PARTITION OF ocanalytics.jurisdiction_day
        FOR VALUES FROM (MINVALUE) TO ('2019-07-01 00:00:00');

