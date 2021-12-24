CREATE TABLE ocsumm2.session_detail_gentime_20211003
        PARTITION OF ocsumm2.session_detail
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

