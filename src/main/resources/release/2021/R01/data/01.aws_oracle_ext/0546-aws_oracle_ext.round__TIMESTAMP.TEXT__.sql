CREATE OR REPLACE FUNCTION aws_oracle_ext.round(value timestamp without time zone, fmt text)
RETURNS timestamp without time zone
AS
$$
WITH cte0 AS (
SELECT
UPPER(fmt) AS fmt,
date_part('year',$1)::int AS y,
date_part('month',$1)::int AS m,
date_part('day',$1)::int AS d,
--
make_date(date_part('year',$1)::int, 1, 1) AS firstDayOfYear,
date_part('isodow',make_date(date_part('year',$1)::int, 1, 1))::int - 1 AS weekdayOfYear,
date_part('isodow',$1)::int - 1 AS weekdayOfMonth,
date_part('isodow',make_date(date_part('year',$1)::int, date_part('month',$1)::int, 1))::int - 1 AS weekdayOfMonth_W
)
, cte1 AS (
SELECT
cte0.*,
DATE_PART('isodow',$1)::int AS z_DAY,
DATE_PART('day',$1 - make_date(y, 1, 1))::int % 7 AS z_WW,
DATE_PART('day',$1 - make_date(y, m, 1))::int % 7 AS z_W,
--
weekdayOfYear - weekdayOfMonth AS diffDay,
CASE
  WHEN weekdayOfYear > 3
  THEN firstDayOfYear - weekdayOfYear * interval '1 day' + interval '1 week'
  ELSE firstDayOfYear - weekdayOfYear * interval '1 day'
END AS isoYear,
weekdayOfMonth_W - weekdayOfMonth AS diffDay_W
FROM cte0)
, cte2 AS (
SELECT
cte1.*,
date_part('isodow'
         ,make_date(date_part('year',isoYear)::int
                   ,date_part('month',isoYear)::int
                   ,date_part('day',isoYear)::int))::int - 1 AS isoWeekdayOfYear
FROM cte1)
, cte AS (
SELECT
cte2.*,
isoWeekdayOfYear - weekdayOfYear AS diffDay_IW
FROM cte2)
SELECT
/* ---------------------------------------------------------------------------- */
CASE
--Century
WHEN cte.fmt IN ('CC', 'SCC') THEN
  CASE
  WHEN date_part('year',$1)::int % 100 > 50
  THEN make_date(floor(date_part('year',$1) / 100)::int * 100 + 101, 1, 1)
  ELSE make_date(floor(date_part('year',$1) / 100)::int * 100 + 1, 1, 1)
  END
--Year
WHEN cte.fmt IN ('SYYYY','YYYY','YEAR','SYEAR','YYY','YY','Y') THEN
  CASE
  WHEN date_part('month',$1) > 6
  THEN date_trunc('year',$1) + interval '1 year'
  ELSE date_trunc('year',$1)
  END
--ISO Year
WHEN cte.fmt IN ('IYYY','IYY','IY','I') THEN
  CASE
  WHEN date_part('month', $1) <= 6
  THEN aws_oracle_ext.trunc($1::timestamp,'IYYY')
  ELSE aws_oracle_ext.trunc($1::timestamp + interval '1 year','IYYY')
  END
--Quarter
WHEN cte.fmt IN ('Q') THEN
  CASE
  WHEN date_part('month',$1) IN (1,4,7,10) OR (date_part('month',$1) IN (2,5,8,11) AND date_part('day',$1) <= 15)
  THEN make_date(date_part('year',$1)::int
                ,date_part('month',$1)::int - (date_part('month',$1)::int - 1) % 3
                ,1)
  WHEN date_part('month',$1) IN (3,6,9,12) OR (date_part('month',$1) IN (2,5,8,11) AND date_part('day',$1) > 15)
  THEN make_date(date_part('year',$1)::int + floor(date_part('month',$1)/11)::int
                ,(date_part('month',$1)::int + ((12 - date_part('month',$1)::int + 1) % 3)) % 12
                ,1)
  END
--Month
WHEN cte.fmt IN ('MONTH','MON','MM','RM') THEN
  CASE
  WHEN date_part('day',$1) >= 16
  THEN date_trunc('month',$1) + interval '1 month'
  ELSE date_trunc('month',$1)
  END
--Week (First day of the year/Same day of the week as the first day of the year)
WHEN cte.fmt IN ('WW') THEN
  CASE
  WHEN z_WW < 4
  THEN date_trunc('day',$1 - z_WW * interval '1 day')
  ELSE date_trunc('day',$1 - z_WW * interval '1 day' + 7 * interval '1 day')
  END
--Week (Monday of that week/Same day of the week as the first day of the ISO year)
WHEN cte.fmt IN ('IW') THEN
  CASE
  WHEN date_part('isodow',$1) < 4 OR (date_part('isodow',$1) = 4 AND date_part('hour',$1) <= 11)
  THEN date_trunc('week',$1)
  ELSE date_trunc('week',$1 + interval '1 week')
  END
--Week (First weekday on which the first day of the month falls/Same day of the week as the first day of the month)
WHEN cte.fmt IN ('W') THEN
  CASE
  WHEN z_W < 4
  THEN date_trunc('day',$1 - z_W * interval '1 day')
  ELSE date_trunc('day',$1 - z_W * interval '1 day' + 7 * interval '1 day')
  END
--Day
WHEN cte.fmt IN ('DDD', 'DD', 'J') THEN
  CASE
  WHEN date_part('hour',$1) > 11
  THEN date_trunc('day',$1) + interval '1 day'
  ELSE date_trunc('day',$1)
  END
--Starting day of the week
WHEN cte.fmt IN ('DAY', 'DY', 'D') THEN
  CASE
  WHEN y > 0
  THEN
    CASE
    WHEN z_DAY < 4
    THEN date_trunc('day',$1 - z_DAY * interval '1 day')
    ELSE date_trunc('day',$1 - z_DAY * interval '1 day' + 7 * interval '1 day')
    END
  ELSE
    CASE
    WHEN z_DAY > 0
    THEN date_trunc('day', $1 + (5 - CASE WHEN z_DAY > 1 THEN z_DAY ELSE z_DAY + 7 END) * interval '1 day')
    ELSE date_trunc('day', $1 + (5 - 7) * interval '1 day')
    END
  END
--Hour
WHEN cte.fmt IN ('HH24', 'HH12', 'HH') THEN
  CASE
  WHEN date_part('minute',$1) >= 30
  THEN date_trunc('hour',$1) + interval '1 hour'
  ELSE date_trunc('hour',$1)
  END
--Minute
WHEN cte.fmt IN ('MI') THEN
  CASE
  WHEN date_part('second',$1) >= 30
  THEN date_trunc('minute',$1) + interval '1 minute'
  ELSE date_trunc('minute',$1)
  END
END AS date_round
/* ---------------------------------------------------------------------------- */
FROM cte;
$$
LANGUAGE SQL
IMMUTABLE 
STRICT;