SELECT `valst_valiutos_kodas`, GROUP_CONCAT( `valstybes_pav`) AS `salys`,COUNT(`id`) AS `kiekis_saliu` FROM `valstybes` GROUP BY `valst_valiutos_kodas`;


SELECT `valst_valiutos_kodas`, `valiutos`.`valiutos_pav`, GROUP_CONCAT( `valstybes_pav`) AS `salys`,COUNT(`valstybes`.`id`) AS `kiekis_saliu` FROM `valstybes` LEFT JOIN `valiutos` ON (`valiutos`.`valiuto_kodas`=`valstybes`.`valst_valiutos_kodas`)GROUP BY `valst_valiutos_kodas`

SELECT `valst`.`valstybes_pav`,`valst`.`valstybes_kodas`,`valiutos`.`valiutos_pav` FROM `valstybes` LEFT JOIN `valiutos` ON ( `valstybes`.`valst_valiutos_kodas`=`valiutos`.`valiuto_kodas` ) LEFT JOIN `valstybes` AS `valst` ON ( `valiutos`.`valiuto_kodas`=`valst`.`valst_valiutos_kodas` ) WHERE `valstybes`.`valstybes_pav`='Australija'



SELECT `valst`.`valstybes_pav`AS `pav.`,`valst`.`valstybes_kodas`AS `kodas`,`valiutos`.`valiutos_pav`AS `val.kodas` FROM `valstybes` LEFT JOIN `valiutos` ON ( `valstybes`.`valst_valiutos_kodas`=`valiutos`.`valiuto_kodas` ) LEFT JOIN `valstybes` AS `valst` ON ( `valiutos`.`valiuto_kodas`=`valst`.`valst_valiutos_kodas` )