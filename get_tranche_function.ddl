create or replace function get_tranche(density_param int, out tranche varchar) 
language plpgsql
as $$
begin
	tranche := (select CASE 
							WHEN density_param <= 100 THEN 'Tranche 1'
							WHEN density_param <= 1000 THEN 'Tranche 2'
							WHEN density_param <= 10000 THEN 'Tranche 3'
							ELSE 'Tranche 4'
						END);
end;
$$;