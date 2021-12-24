CREATE TABLE ocanalytics.content_day_cd_date_20190801
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2019-07-01 00:00:00') TO ('2019-08-01 00:00:00');

