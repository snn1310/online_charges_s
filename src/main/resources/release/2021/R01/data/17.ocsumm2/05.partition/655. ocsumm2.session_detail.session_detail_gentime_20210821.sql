CREATE TABLE ocsumm2.session_detail_gentime_20210821
        PARTITION OF ocsumm2.session_detail
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');

