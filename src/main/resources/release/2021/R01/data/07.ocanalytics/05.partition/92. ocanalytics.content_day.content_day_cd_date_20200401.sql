CREATE TABLE ocanalytics.content_day_cd_date_20200401
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2020-03-01 00:00:00') TO ('2020-04-01 00:00:00');

