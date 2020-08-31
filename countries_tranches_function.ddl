-- function that returns coutries with density and slice(tranche)
CREATE OR REPLACE FUNCTION get_tranches_all () 
	RETURNS TABLE (
		country_param varchar,
		density_param int,
		tranche_param varchar
	) 
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY 
		SELECT
			country,
			density,
			get_tranche(density) as tranche
		FROM
			countries;
END;$$;