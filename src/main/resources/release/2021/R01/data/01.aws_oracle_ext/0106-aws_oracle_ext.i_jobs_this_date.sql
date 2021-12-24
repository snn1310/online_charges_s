CREATE INDEX IF NOT EXISTS i_jobs_this_date
    ON aws_oracle_ext.jobs(next_date, job)
    WHERE (this_date IS NULL);