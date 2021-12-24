CREATE TABLE ocanalytics.content_day_cd_date_20211101
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-11-01 00:00:00');

