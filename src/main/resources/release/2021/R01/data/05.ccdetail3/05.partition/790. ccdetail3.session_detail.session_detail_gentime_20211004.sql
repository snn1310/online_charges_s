CREATE TABLE ccdetail3.session_detail_gentime_20211004
        PARTITION OF ccdetail3.session_detail
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

