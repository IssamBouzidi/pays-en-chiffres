-- function that returns coutries with density and slice(tranche)
CREATE OR REPLACE FUNCTION get_tranches_all () 
	RETURNS TABLE (
		country varchar,
		density int,
		tranche varchar
	) 
	LANGUAGE plpgsql
AS $$
BEGIN
	RETURN QUERY 
		SELECT
			c.country,
			c.density,
			get_tranche(c.density) as tranche
		FROM
			country c;
END;$$;