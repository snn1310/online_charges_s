CREATE TABLE ocanalytics.test_day_ud_date_20210401
        PARTITION OF ocanalytics.test_day
        FOR VALUES FROM ('2021-03-01 00:00:00') TO ('2021-04-01 00:00:00');

