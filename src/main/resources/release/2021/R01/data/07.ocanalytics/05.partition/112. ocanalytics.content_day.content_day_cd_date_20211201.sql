CREATE TABLE ocanalytics.content_day_cd_date_20211201
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2021-11-01 00:00:00') TO ('2021-12-01 00:00:00');

