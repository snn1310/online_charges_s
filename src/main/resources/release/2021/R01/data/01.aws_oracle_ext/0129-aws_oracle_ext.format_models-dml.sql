DELETE FROM aws_oracle_ext.format_models;

INSERT INTO aws_oracle_ext.format_models(fmt, tp, ord, grp, wrapto)
VALUES
('RM', 'datetime', 7, 'R', NULL),
('IW', 'datetime', 12, 'I', NULL),
('I', 'datetime', 15, 'I', NULL),
('IYY', 'datetime', 6, 'I', NULL),
('IY', 'datetime', 9, 'I', NULL),
('IYYY', 'datetime', 3, 'I', NULL),
('MM', 'datetime', 3, 'M', NULL),
('MI', 'datetime', 6, 'M', NULL),
('W', 'datetime', 6, 'W', NULL),
('WSP', 'datetime', 5, 'W', NULL),
('QSP', 'datetime', 2, 'Q', NULL),
('QSPTH', 'datetime', 1, 'Q', NULL),
('HH12TH', 'datetime', 4, 'H', NULL),
('IWTH', 'datetime', 11, 'I', NULL),
('IWSP', 'datetime', 11, 'I', NULL),
('IYYYTH', 'datetime', 2, 'I', NULL),
('IYTH', 'datetime', 8, 'I', NULL),
('WTHSP', 'datetime', 4, 'W', NULL),
('HH12SPTH', 'datetime', 2, 'H', NULL),
('MMSPTH', 'datetime', 1, 'M', NULL),
('MMSP', 'datetime', 2, 'M', NULL),
('ISP', 'datetime', 14, 'I', NULL),
('JTH', 'datetime', 2, 'J', NULL),
('YYYYTHSP', 'datetime', 1, 'Y', NULL),
('IYYSPTH', 'datetime', 4, 'I', NULL),
('IYYYSPTH', 'datetime', 1, 'I', NULL),
('WSPTH', 'datetime', 4, 'W', NULL),
('JSP', 'datetime', 2, 'J', NULL),
('WTH', 'datetime', 5, 'W', NULL),
('MMTH', 'datetime', 2, 'M', NULL),
('IYTHSP', 'datetime', 7, 'I', NULL),
('MMTHSP', 'datetime', 1, 'M', NULL),
('IYYTH', 'datetime', 5, 'I', NULL),
('IWSPTH', 'datetime', 10, 'I', NULL),
('IYSP', 'datetime', 8, 'I', NULL),
('HHTHSP', 'datetime', 7, 'H', NULL),
('IYYYTHSP', 'datetime', 1, 'I', NULL),
('JSPTH', 'datetime', 1, 'J', NULL),
('YYYYTH', 'datetime', 2, 'Y', NULL),
('HH24SPTH', 'datetime', 1, 'H', NULL),
('HH24THSP', 'datetime', 1, 'H', NULL),
('HH24TH', 'datetime', 3, 'H', NULL),
('HH24SP', 'datetime', 3, 'H', NULL),
('HHSP', 'datetime', 8, 'H', NULL),
('IYSPTH', 'datetime', 7, 'I', NULL),
('IWTHSP', 'datetime', 10, 'I', NULL),
('MISPTH', 'datetime', 4, 'M', NULL),
('HH12SP', 'datetime', 4, 'H', NULL),
('HH12THSP', 'datetime', 2, 'H', NULL),
('IYYTHSP', 'datetime', 4, 'I', NULL),
('QTHSP', 'datetime', 1, 'Q', NULL),
('IYYSP', 'datetime', 5, 'I', NULL),
('YYYYSPTH', 'datetime', 1, 'Y', NULL),
('HHSPTH', 'datetime', 7, 'H', NULL),
('MISP', 'datetime', 5, 'M', NULL),
('MITHSP', 'datetime', 4, 'M', NULL),
('MITH', 'datetime', 5, 'M', NULL),
('ITH', 'datetime', 14, 'I', NULL),
('YYYYSP', 'datetime', 2, 'Y', NULL),
('HHTH', 'datetime', 8, 'H', NULL),
('IYYYSP', 'datetime', 2, 'I', NULL),
('QTH', 'datetime', 2, 'Q', NULL),
('ISPTH', 'datetime', 13, 'I', NULL),
('ITHSP', 'datetime', 13, 'I', NULL),
('CCSPTH', 'datetime', 1, 'C', NULL),
('CCTHSP', 'datetime', 1, 'C', NULL),
('CCSP', 'datetime', 2, 'C', NULL),
('CC', 'datetime', 3, 'C', NULL),
('CCTH', 'datetime', 2, 'C', NULL),
('DDD', 'datetime', 3, 'D', NULL),
('DDDTHSP', 'datetime', 1, 'D', NULL),
('DDDSP', 'datetime', 2, 'D', NULL),
('DDDTH', 'datetime', 2, 'D', NULL),
('DDDSPTH', 'datetime', 1, 'D', NULL),
('D', 'datetime', 11, 'D', NULL),
('DD', 'datetime', 8, 'D', NULL),
('DDSP', 'datetime', 7, 'D', NULL),
('DDTHSP', 'datetime', 6, 'D', NULL),
('DDSPTH', 'datetime', 6, 'D', NULL),
('DDTH', 'datetime', 7, 'D', NULL),
('DS', 'datetime', 5, 'D', NULL),
('DL', 'datetime', 5, 'D', NULL),
('DAY', 'datetime', 5, 'D', 'tm\1'),
('DY', 'datetime', 5, 'D', 'tm\1'),
('WW', 'datetime', 3, 'W', 'WW'),
('WWSP', 'datetime', 2, 'W', 'WWSP'),
('TS', 'datetime', 0, 'T', NULL),
('TZD', 'datetime', 0, 'T', NULL),
('TZR', 'datetime', 0, 'T', NULL),
('AD', 'datetime', 0, 'A', NULL),
('AM', 'datetime', 0, 'A', NULL),
('BC', 'datetime', 0, 'B', NULL),
('MON', 'datetime', 8, 'M', 'tm\1'),
('MONTH', 'datetime', 7, 'M', 'tm\1'),
('SSSSSTHSP', 'datetime', 1, 'S', NULL),
('SSSSSSPTH', 'datetime', 1, 'S', NULL),
('SSTH', 'datetime', 5, 'S', NULL),
('SSSSSTH', 'datetime', 2, 'S', NULL),
('YYY', 'datetime', 7, 'Y', NULL),
('YY', 'datetime', 10, 'Y', NULL),
('Y', 'datetime', 13, 'Y', NULL),
('YYSPTH', 'datetime', 8, 'Y', NULL),
('YTH', 'datetime', 12, 'Y', NULL),
('YSPTH', 'datetime', 11, 'Y', NULL),
('YYYSP', 'datetime', 6, 'Y', NULL),
('YYYTH', 'datetime', 6, 'Y', NULL),
('YYTHSP', 'datetime', 8, 'Y', NULL),
('YTHSP', 'datetime', 11, 'Y', NULL),
('YYYTHSP', 'datetime', 5, 'Y', NULL),
('YYSP', 'datetime', 9, 'Y', NULL),
('YYYSPTH', 'datetime', 5, 'Y', NULL),
('YYTH', 'datetime', 9, 'Y', NULL),
('EE', 'datetime', 21, 'Y', NULL),
('E', 'datetime', 22, 'Y', NULL),
('DTH', 'datetime', 10, 'D', NULL),
('DTHSP', 'datetime', 9, 'D', NULL),
('WWSPTH', 'datetime', 1, 'W', NULL),
('WWTH', 'datetime', 2, 'W', NULL),
('WWTHSP', 'datetime', 1, 'W', NULL),
('RRRRSP', 'datetime', 2, 'R', 'R->Y'),
('RRTHSP', 'datetime', 4, 'R', 'R->Y'),
('RRTH', 'datetime', 5, 'R', 'R->Y'),
('RRSP', 'datetime', 5, 'R', 'R->Y'),
('RRSPTH', 'datetime', 4, 'R', 'R->Y'),
('RRRRSPTH', 'datetime', 1, 'R', 'R->Y'),
('RRRRTHSP', 'datetime', 1, 'R', 'R->Y'),
('RRRRTH', 'datetime', 2, 'R', 'R->Y'),
('RR', 'datetime', 6, 'R', 'R->Y'),
('RRRR', 'datetime', 3, 'R', 'R->Y'),
('A\.D\.', 'datetime', 0, 'A', NULL),
('A\.M\.', 'datetime', 0, 'A', NULL),
('B\.C\.', 'datetime', 0, 'B', NULL),
('P\.M\.', 'datetime', 0, 'P', NULL),
('FM', 'datetime', 999, 'F', NULL),
('FX', 'datetime', 999, 'F', NULL),
('HH', 'datetime', 9, 'H', NULL),
('HH12', 'datetime', 6, 'H', NULL),
('HH24', 'datetime', 5, 'H', NULL),
('J', 'datetime', 3, 'J', NULL),
('PM', 'datetime', 0, 'P', NULL),
('Q', 'datetime', 3, 'Q', NULL),
('\.', 'number',0, '.', NULL),
('\,', 'number',0, ',', NULL),
('\$', 'number',0, '$', NULL),
('0', 'number',0, '0', NULL),
('9', 'number',0, '9', NULL),
('B', 'number',0, 'B', NULL),
('C', 'number',0, 'C', NULL),
('EEEE', 'number',0, 'E', NULL),
('G', 'number',0, 'G', NULL),
('L', 'number',0, 'L', NULL),
('PR', 'number',0, 'P', NULL),
('RN', 'number',0, 'R', NULL),
('rn', 'number',0, 'R', NULL),
('S', 'number',0, 'S', NULL),
('TME', 'number',0, 'T', NULL),
('TM', 'number',1, 'T', NULL),
('U', 'number',0, 'U', NULL),
('V', 'number',0, 'V', NULL),
('FF3', 'datetime', 3, 'F', NULL),
('FF4', 'datetime', 3, 'F', NULL),
('FF5', 'datetime', 3, 'F', NULL),
('FF6', 'datetime', 3, 'F', NULL),
('FF1', 'datetime', 3, 'F', NULL),
('FF6TH', 'datetime', 2, 'F', NULL),
('FF6THSP', 'datetime', 1, 'F', NULL),
('FF2THSP', 'datetime', 1, 'F', NULL),
('FF2SPTH', 'datetime', 1, 'F', NULL),
('FF4TH', 'datetime', 2, 'F', NULL),
('FF3SPTH', 'datetime', 1, 'F', NULL),
('FF1SP', 'datetime', 2, 'F', NULL),
('FF4THSP', 'datetime', 1, 'F', NULL),
('FF6SPTH', 'datetime', 1, 'F', NULL),
('FF4SPTH', 'datetime', 1, 'F', NULL),
('FF2SP', 'datetime', 2, 'F', NULL),
('FF5THSP', 'datetime', 1, 'F', NULL),
('FF5TH', 'datetime', 2, 'F', NULL),
('FF5SPTH', 'datetime', 1, 'F', NULL),
('FF1SPTH', 'datetime', 1, 'F', NULL),
('FF3THSP', 'datetime', 1, 'F', NULL),
('FF6SP', 'datetime', 2, 'F', NULL),
('FF5SP', 'datetime', 2, 'F', NULL),
('FF4SP', 'datetime', 2, 'F', NULL),
('FF1THSP', 'datetime', 1, 'F', NULL),
('FF1TH', 'datetime', 2, 'F', NULL),
('FF3SP', 'datetime', 2, 'F', NULL),
('FF3TH', 'datetime', 2, 'F', NULL),
('FF2TH', 'datetime', 2, 'F', NULL),
('FF2', 'datetime', 3, 'F', NULL),
('FF7', 'datetime', 3, 'F', NULL),
('FF8', 'datetime', 3, 'F', NULL),
('FF9', 'datetime', 3, 'F', NULL),
('FF', 'datetime', 4, 'F', 'FF6'),
('FFSPTH', 'datetime', 1, 'F', 'FF6SPTH'),
('FFTHSP', 'datetime', 1, 'F', 'FF6THSP'),
('FFSP', 'datetime', 2, 'F', 'FF6SP'),
('FFTH', 'datetime', 2, 'F', 'FF6TH'),
('D', 'number',0, 'D', NULL),
('MI', 'number',0, 'M', NULL),
('JTHSP', 'datetime', 1, 'J', NULL),
('X', 'number',0, 'X', NULL),
('X', 'datetime', 0, 'X', NULL),
('SSSSSSP', 'datetime', 2, 'S', NULL),
('SCCSP', 'datetime', 11, 'S', NULL),
('SCCTH', 'datetime', 11, 'S', NULL),
('SSSPTH', 'datetime', 4, 'S', NULL),
('SYYYYTH', 'datetime', 8, 'S', NULL),
('SSTHSP', 'datetime', 4, 'S', NULL),
('SCCSPTH', 'datetime', 10, 'S', NULL),
('SCCTHSP', 'datetime', 10, 'S', NULL),
('SYYYYSP', 'datetime', 8, 'S', NULL),
('SSSP', 'datetime', 5, 'S', NULL),
('SYYYYTHSP', 'datetime', 7, 'S', NULL),
('SYEAR', 'datetime', 13, 'S', NULL),
('SCC', 'datetime', 12, 'S', NULL),
('SSSSS', 'datetime', 3, 'S', NULL),
('SS', 'datetime', 6, 'S', NULL),
('SYYYY', 'datetime', 9, 'S', NULL),
('SYYYYSPTH', 'datetime', 7, 'S', NULL),
('YSP', 'datetime', 12, 'Y', NULL),
('YYYY', 'datetime', 4, 'Y', NULL),
('Y\,YYYTHSP', 'datetime', 14, 'Y', NULL),
('Y\,YYYTH', 'datetime', 15, 'Y', NULL),
('Y\,YYYSPTH', 'datetime', 14, 'Y', NULL),
('Y\,YYYSP', 'datetime', 15, 'Y', NULL),
('Y\,YYY', 'datetime', 16, 'Y', NULL),
('YEAR', 'datetime', 0, 'Y', NULL),
('FM', 'number', 0, 'F', NULL),
('TZHSPTH', 'datetime', 1, 'T', NULL),
('TZHTHSP', 'datetime', 1, 'T', NULL),
('TZHSP', 'datetime', 2, 'T', NULL),
('TZHTH', 'datetime', 2, 'T', NULL),
('TZH', 'datetime', 3, 'T', NULL),
('TZMSPTH', 'datetime', 1, 'T', NULL),
('TZMTHSP', 'datetime', 1, 'T', NULL),
('TZMSP', 'datetime', 2, 'T', NULL),
('TZMTH', 'datetime', 2, 'T', NULL),
('TZM', 'datetime', 3, 'T', NULL);