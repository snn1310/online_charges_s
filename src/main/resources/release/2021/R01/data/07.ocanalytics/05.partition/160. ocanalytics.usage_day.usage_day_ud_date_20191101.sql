CREATE TABLE ocanalytics.usage_day_ud_date_20191101
        PARTITION OF ocanalytics.usage_day
        FOR VALUES FROM ('2019-10-01 00:00:00') TO ('2019-11-01 00:00:00');

