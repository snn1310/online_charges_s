--DROP FUNCTION aws_oracle_ext.first_weekday(territory text);
CREATE OR REPLACE FUNCTION aws_oracle_ext.first_weekday(territory text)
RETURNS integer
AS 
$$ 
SELECT
CASE
WHEN territory IN ('AMERICA', 'BAHRAIN', 'BRAZIL', 'CANADA', 'CHINA', 'HONG KONG',
                   'INDIA', 'ISRAEL', 'JAPAN', 'KOREA', 'KUWAIT', 'MALAYSIA',
                   'PORTUGAL', 'SINGAPORE', 'SOUTH AFRICA', 'TAIWAN', 'THAILAND',
                   'UNITED ARAB EMIRATES', 'VIETNAM')
THEN 1 --Sunday is the first day of week
WHEN territory IN ('DJIBOUTI', 'EGYPT', 'IRAQ', 'JORDAN', 'LEBANON', 'LIBYA', 'MAURITANIA', 'MOROCCO', 'OMAN',
                   'QATAR', 'SAUDI ARABIA', 'SOMALIA', 'SUDAN', 'SYRIA', 'TUNISIA', 'YEMEN')
THEN 2 --Saturday is the first day of week
WHEN territory = 'BANGLADESH'
THEN 3 --Friday is the first day of week
ELSE 0 --Monday is the first day of week
END;
$$
LANGUAGE SQL 
IMMUTABLE 
STRICT;
