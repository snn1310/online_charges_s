CREATE TABLE ocanalytics.content_day_cd_date_20191001
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2019-09-01 00:00:00') TO ('2019-10-01 00:00:00');

