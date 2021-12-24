comment on table aws_oracle_ext.jobs is 'Jobs to be executed periodically';
comment on column aws_oracle_ext.jobs.job is 'Primary key';
comment on column aws_oracle_ext.jobs.name is 'Name. Reserved for future use';
comment on column aws_oracle_ext.jobs.description is 'Description. Reserved for future use';
comment on column aws_oracle_ext.jobs.log_user is 'Login user when the job was submitted';
comment on column aws_oracle_ext.jobs.priv_user is 'User whose default privileges apply to this job';
comment on column aws_oracle_ext.jobs.schema_user is 'Default schema used to parse the job';
comment on column aws_oracle_ext.jobs.search_path is 'Default search path used to parse the job';
comment on column aws_oracle_ext.jobs.what is 'Body of the anonymous block that the job executes';
comment on column aws_oracle_ext.jobs.last_date is 'Date on which this job last successfully executed';
comment on column aws_oracle_ext.jobs.this_date is 'Date that this job started executing (usually null if not executing)';
comment on column aws_oracle_ext.jobs.next_date is 'Date that this job will next be executed';
comment on column aws_oracle_ext.jobs.interval is 'A date function, evaluated at the start of execution, becomes next next_date';
comment on column aws_oracle_ext.jobs.total_time is 'Total wall clock time spent by the system on this job (in seconds) since the first time this job executed. This value is cumulative.';
comment on column aws_oracle_ext.jobs.broken is 'Y: no attempt is made to run this job; N: an attempt is made to run this job';
comment on column aws_oracle_ext.jobs.failures is 'Number of times the job has started and failed since its last success';
comment on column aws_oracle_ext.jobs.last_failure_message is 'Error message if the job has failed last time';

