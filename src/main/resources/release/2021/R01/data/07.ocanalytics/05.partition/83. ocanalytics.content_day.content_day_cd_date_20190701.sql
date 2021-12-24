CREATE TABLE ocanalytics.content_day_cd_date_20190701
        PARTITION OF ocanalytics.content_day
        FOR VALUES FROM (MINVALUE) TO ('2019-07-01 00:00:00');

