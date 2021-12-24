CREATE TABLE ocanalytics.content_day_cd_date_20200101
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2019-12-01 00:00:00') TO ('2020-01-01 00:00:00');

