with tb_cand as (
    select
		SQ_CANDIDATO,
		SG_UF,
		DS_CARGO,
		SG_PARTIDO,
		NM_PARTIDO,
		DT_NASCIMENTO,
		DS_GENERO,
		DS_GRAU_INSTRUCAO,
		DS_ESTADO_CIVIL,
		DS_COR_RACA,
		DS_OCUPACAO
    from tb_candidaturas
),
tb_total_bens as(
	select
		SQ_CANDIDATO,
		cast(replace(VR_BEM_CANDIDATO,',','.') as decimal(15,2))
	from tb_bens
)

select * from tb_total_bens;
