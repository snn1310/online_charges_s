CREATE TABLE ccdetail2.session_detail_gentime_20211002
        PARTITION OF ccdetail2.session_detail
        FOR VALUES FROM ('2021-10-01 00:00:00') TO ('2021-10-02 00:00:00');

