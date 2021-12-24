CREATE TABLE ocanalytics.content_day_cd_date_20200201
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2020-01-01 00:00:00') TO ('2020-02-01 00:00:00');

