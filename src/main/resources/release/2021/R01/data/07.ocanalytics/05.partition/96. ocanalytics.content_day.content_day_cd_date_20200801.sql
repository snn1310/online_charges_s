CREATE TABLE ocanalytics.content_day_cd_date_20200801
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2020-07-01 00:00:00') TO ('2020-08-01 00:00:00');

