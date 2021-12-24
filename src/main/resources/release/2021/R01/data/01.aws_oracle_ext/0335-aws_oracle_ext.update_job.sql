/*
  Updates a job as executed

  Parameters:
    p_job -- Number of job to be updated
    p_error_message -- Error message if any has occurred
  
  Returns:
    void
*/
create or replace function aws_oracle_ext.update_job
  ( in p_job aws_oracle_ext.jobs.job%type
  , in p_error_message aws_oracle_ext.jobs.last_failure_message%type default null )
returns void
as
$$
  declare
    l_failure boolean := p_error_message is not null and p_error_message <> '';
    l_interval aws_oracle_ext.jobs."interval"%type;
    l_next_date timestamp with time zone;
    l_now timestamp with time zone := clock_timestamp();
  begin
    begin
      select j.interval into strict l_interval from aws_oracle_ext.jobs j where j.job = p_job;
    exception
      when no_data_found then
        raise exception 'Job #% not found', p_job;
    end;
  
    execute 'select ' || l_interval into l_next_date;

    if l_next_date is not null or l_failure then
      update aws_oracle_ext.jobs j
         set last_date = case when l_failure then last_date else this_date end
           , this_date = null
           , failures = case when l_failure then failures + 1 else 0 end
           , broken = case when l_failure and failures + 1 > 16 then 'Y' else 'N' end
           , last_failure_message = case when l_failure then p_error_message end
           , next_date = coalesce( l_next_date, next_date )
           , total_time = total_time + case when l_failure then 0 else extract( second from l_now - this_date ) end
       where j.job = p_job
         and j.this_date is not null;
    end if;   

    if l_next_date is null and not l_failure then
      delete from aws_oracle_ext.jobs where job = p_job;
    end if;
  end;
$$ language plpgsql;