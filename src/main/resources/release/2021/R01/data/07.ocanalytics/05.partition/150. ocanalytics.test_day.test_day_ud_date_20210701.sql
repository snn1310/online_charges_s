CREATE TABLE ocanalytics.test_day_ud_date_20210701
        PARTITION OF ocanalytics.test_day
        FOR VALUES FROM ('2021-06-01 00:00:00') TO ('2021-07-01 00:00:00');

