CREATE TABLE ocanalytics.usage_day_ud_date_20200401
        PARTITION OF ocanalytics.usage_day
        FOR VALUES FROM ('2020-03-01 00:00:00') TO ('2020-04-01 00:00:00');

