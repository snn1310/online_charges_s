CREATE TABLE ocanalytics.content_day_cd_date_20201101
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM ('2020-10-01 00:00:00') TO ('2020-11-01 00:00:00');

