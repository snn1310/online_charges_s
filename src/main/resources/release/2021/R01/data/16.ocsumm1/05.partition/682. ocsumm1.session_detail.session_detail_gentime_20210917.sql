CREATE TABLE ocsumm1.session_detail_gentime_20210917
        PARTITION OF ocsumm1.session_detail
        FOR VALUES FROM ('2021-09-16 00:00:00') TO ('2021-09-17 00:00:00');

