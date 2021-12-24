create or replace function aws_oracle_ext.xmltype$tojson(pXML xml, pTargetJObj json)
returns json stable
language plpgsql
as $$
declare
    ILIMIT constant integer := 1024;
    PDELIMETER constant varchar(1) := '/';
    PROOT constant varchar(2) := '//';
    XVALUE constant varchar(7) := '/text()';
    XSCHEMA constant varchar(3) := 'xsi';
    XURI constant varchar(41) := 'http://www.w3.org/2001/XMLSchema-instance';

    mainData aws_oracle_ext.xmltype$txml2json[];
    dummyData aws_oracle_ext.xmltype$txml2json[];
    lnMx int;
    lnMn int;
begin

	if pXML is null or pTargetJObj is null then
	    raise exception 'XMLTYPE.Null Exception.' using hint = '29532';
	end if;

	with recursive rStructure (iNum, rNum, pNum, recFullKey, recKey, recValue, recValType)
	               as (select 0 as iNum,
		                      row_number() over () as rNum,
		                      0::bigint as pNum,
		                      t.key as recFullKey,
		                      t.key as recKey,
		                      t.value as recValue,
		                      json_typeof(t.value) as recValType
		                 from json_each(pTargetJObj) t
		                union all
		               select r.iNum + 1 as iNum,
		                       row_number() over () as rNum,
		                       r.rNum as pNum,
		                       r.recFullKey||PDELIMETER||t.key as recFullKey,
		                       t.key as recKey,
		                       t.value as recValue,
		                       json_typeof(t.value) as recValType
		                  from rStructure r left join json_each(r.recValue) t on r.recValue is not null
		                 where r.recValType = json_typeof(pTargetJObj)
		                   and r.iNum < ILIMIT
		               ),
				   rMatchData (iNum, rNum, pNum, recFullKey, recKey, recValue, recValType)
				   as (select r.iNum as iNum,
			              	  r.rNum as rNum,
			              	  r.pNum as pNum,
			              	  r.recFullKey as recFullKey,
			              	  r.recKey as recKey,
			              	  to_json(case when r.recValType != json_typeof(pTargetJObj) then
								              coalesce((xpath(PROOT||r.recFullKey||XVALUE, pXML, array[array[XSCHEMA, XURI]]))[1]::text,
								                       (xpath(PROOT||r.recFullKey, pXML, array[array[XSCHEMA, XURI]]))[1]::text
						                     		  )
					                       else null end
					                  ) as recValue,
			                  r.recValType as recValType
			             from rStructure r
			            where r.recFullKey is not null
			          )
    select array_agg(row(d.iNum, d.rNum, d.pNum, d.recKey, d.recValue)::aws_oracle_ext.xmltype$txml2json)
      into mainData
      from rMatchData d;

    select max(iNum), min(iNum)
      into lnMx, lnMn
      from unnest(mainData);

    select array_agg(row(d.iNum, null, d.pNum, null, d.recValue)::aws_oracle_ext.xmltype$txml2json)
      into dummyData
      from (select d1.iNum, d1.pNum, json_object_agg(d1.recKey, d1.recValue) recValue
              from unnest(mainData) d1
             where d1.iNum = lnMx
             group by d1.iNum, d1.pNum
           ) d;

    for i in reverse lnMx -1 .. lnMn loop
		 select array_agg(row(d.iNum, null, d.pNum, null, d.recValue)::aws_oracle_ext.xmltype$txml2json)
		   into dummyData
		   from (select d1.iNum, d1.pNum, json_object_agg(d1.recKey, coalesce(d1.recValue, g1.recValue)) recValue
				   from unnest(mainData) d1 left join unnest(dummyData) g1 on d1.iNum = g1.iNum -1 and d1.rNum = g1.pNum
				  where d1.iNum = i
				  group by d1.iNum, d1.pNum
		        ) d;
	end loop;

    return dummyData[1].recValue;
end; $$