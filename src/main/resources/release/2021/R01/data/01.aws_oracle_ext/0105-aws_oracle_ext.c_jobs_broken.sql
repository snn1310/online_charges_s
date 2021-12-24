ALTER TABLE aws_oracle_ext.jobs
    ADD CONSTRAINT c_jobs_broken CHECK (broken IN ('Y', 'N'));