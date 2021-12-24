create or replace function aws_oracle_ext.dbms_xmlgen$qc2XMLTab(pvSQL text, pCr refcursor, pnLimit int default null, pnOffset int default null)
returns table(xmlrow xml)
language sql stable
as $$
 	 select xrs.row
	   from query_to_xml(format($q$ select * from (%1$s) q limit %2$L::int offset %3$L::int $q$,
	                            pvSQL,
	                            nullif(greatest(pnLimit, sign(pnLimit)), -1),
	                            nullif(greatest(pnOffset, 0), 0)
	                           ),
	                     false,
	                     false,
	                     ''
	                    ) as xt(xml_data),
	        xmltable('//table/row' passing xt.xml_data columns row xml path '*' ) xrs
	  where nullif(pvSQL, '') is not null
	    and nullif(pCr::text, '') is null
	 union all
	 (select xrs.row
	    from cursor_to_xml(pCr,
	                       coalesce(pnLimit,
	                                nullif(greatest(pnLimit, sign(pnLimit)), -1),
	                                2147483647)::int,
	                       false,
	                       false,
	                       ''
	                      ) as xt(xml_data),
	         xmltable('//table/row' passing xt.xml_data columns row xml path '*' ) xrs
	   where aws_oracle_ext.dbms_xmlgen$crIsOpened(pCr)
	     and nullif(pvSQL, '') is null
	     and nullif(pCr::text, '') is not null
	   offset nullif(greatest(pnOffset, 0), 0)
	 );
$$