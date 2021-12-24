CREATE TABLE ocanalytics.test_day_ud_date_20201201
        PARTITION OF ocanalytics.test_day
        FOR VALUES FROM (MINVALUE) TO ('2020-12-01 00:00:00');

