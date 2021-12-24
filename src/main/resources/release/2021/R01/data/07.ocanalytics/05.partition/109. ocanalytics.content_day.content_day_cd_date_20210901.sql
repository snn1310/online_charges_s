CREATE TABLE ocanalytics.content_day_cd_date_20210901
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2021-08-01 00:00:00') TO ('2021-09-01 00:00:00');

