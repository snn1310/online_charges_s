/*
Returns next p_limit jobs ready for execution

Parameters:
  p_next_data_before -- Job having next_date less than this parameter's value is ready for execution
  p_limit -- Count of rows to be returned

Returns:
  job -- Job's number
  what -- Job's body to be executed
  search_path -- Need to be set in the session before executing a job to resolve the objects
*/
create or replace function aws_oracle_ext.get_jobs
  ( in p_next_date_before timestamp default current_timestamp
  , in p_limit integer default 1 ) 
returns table( job aws_oracle_ext.jobs.job%type, what aws_oracle_ext.jobs.what%type, search_path aws_oracle_ext.jobs.search_path%type)
as
$$
  declare
    l_this_date timestamp with time zone := clock_timestamp();
  begin
    return query 
      update aws_oracle_ext.jobs j
         set this_date = l_this_date
        from (
          select jj.job
            from aws_oracle_ext.jobs jj
           where jj.this_date is null
             and broken <> 'Y'
             and jj.next_date <= p_next_date_before
             and pg_try_advisory_xact_lock( jj.job )
           limit p_limit
             for update
        ) jj
       where j.job = jj.job
      returning j.job, j.what, j.search_path;
  end;
$$ language plpgsql;