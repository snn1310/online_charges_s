CREATE TABLE ocanalytics.usage_day_ud_date_20190701
        PARTITION OF ocanalytics.usage_day
        FOR VALUES FROM (MINVALUE) TO ('2019-07-01 00:00:00');

