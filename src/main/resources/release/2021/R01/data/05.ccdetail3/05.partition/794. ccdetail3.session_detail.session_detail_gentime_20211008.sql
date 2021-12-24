CREATE TABLE ccdetail3.session_detail_gentime_20211008
        PARTITION OF ccdetail3.session_detail
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

