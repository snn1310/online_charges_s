CREATE TABLE ccdetail2.discount_detail_gentime_20210902
        PARTITION OF ccdetail2.discount_detail
        FOR VALUES FROM ('2021-09-01 00:00:00') TO ('2021-09-02 00:00:00');

