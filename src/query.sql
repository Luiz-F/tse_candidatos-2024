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
		sum(cast(VR_BEM_CANDIDATO as decimal(15,2))) TOTAL_BENS
	from tb_bens
GROUP BY 1
),

tb_info_compelta as (
select 
	tb_cand.*,
	COALESCE (tb_total_bens.TOTAL_BENS,666) TotalBens
from tb_total_bens 
JOIN tb_cand on tb_cand.SQ_CANDIDATO = tb_total_bens.SQ_CANDIDATO
)

select
	sg_partido,
	nm_partido,
	concat(round(avg(case when ds_genero = 'FEMININO' then 1 else 0 end ) *100,2),'%') 'TxMulheres',
	concat(round(avg(case when ds_genero = 'MASCULINO' then 1 else 0 end ) *100,2),'%')  'TxHomens',
	avg(case when ds_cor_raca = 'PRETA' then 1 else 0 end) txNegros,
  avg(case when ds_cor_raca = 'BRANCA' then 1 else 0 end) txBrancos,
  avg(case when ds_cor_raca = 'PARDA' then 1 else 0 end) txPardos
from tb_info_compelta
group by 1,2
order by 3 desc


