CREATE TABLE ocsumm1.session_detail_gentime_20211002
        PARTITION OF ocsumm1.session_detail
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

