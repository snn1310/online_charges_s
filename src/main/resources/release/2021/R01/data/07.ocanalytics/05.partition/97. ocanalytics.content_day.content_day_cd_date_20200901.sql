CREATE TABLE ocanalytics.content_day_cd_date_20200901
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2020-08-01 00:00:00') TO ('2020-09-01 00:00:00');

