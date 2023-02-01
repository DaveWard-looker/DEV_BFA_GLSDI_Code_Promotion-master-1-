
#
view: security_bfa {
  derived_table: {
    sql:
    select
    distinct UUID  as joining_column,
    'ALL' as security_group_bfa,

      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id in ('WPB1', 'WPB2', 'WPB3', 'CMB1', 'GBM1','1')) product
      on currency.fotc_product= product.code

      union all

      select
      distinct UUID  as joining_column,
      'ENTITY-EXCO' as security_group_bfa
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id in ('WPB1',  'CMB1')) product
      on currency.fotc_product= product.code

      union all

      select distinct UUID  as joining_column,
      'WPB' as security_group_bfa,
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and  dimension_tree_id in ('WPB1', 'WPB2', 'WPB3','1')) product
      on currency.fotc_product= product.code
      where segment.level_1= 'GSS10001'




      union all

      select distinct UUID  as joining_column,
      'WPB-EXCO' as security_group_bfa,
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id in  ('WPB1', 'WPB2', 'WPB3','1')) product
      on currency.fotc_product= product.code
      where segment.level_1= 'GSS10001'






      union all

      select distinct UUID  as joining_column,
      'CMB' as security_group_bfa,
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id in ('CMB1','1')) product
      on currency.fotc_product= product.code
      where segment.level_1= 'GSS10002'



      union all


      select a.joining_column as joining_column,a.security_group_bfa as security_group_bfa
      from (
      select distinct UUID  as joining_column,
      (case when  segment.level_1= 'GSS10002' and product.level_1 like 'GSP10001_ALT_CMB1' then 'GLCM'
      when  segment.level_1= 'GSS10002' and product.level_1 like 'GSP10002_ALT_CMB1' then 'GTRF'
      when  segment.level_1= 'GSS10002' and product.level_1 like 'GSP10003_ALT_CMB1' then 'LTM'
      when  segment.level_1= 'GSS10002' and product.level_1 like 'GSP10005_ALT_CMB1' then 'CFGM'
      end) as security_group_bfa

      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id ='CMB1') product
      on currency.fotc_product= product.code
      where segment.level_1= 'GSS10002' and product.level_1 in ('GSP10001_ALT_CMB1','GSP10002_ALT_CMB1','GSP10003_ALT_CMB1','GSP10005_ALT_CMB1')) a
      where a.security_group_bfa is not null

      UNION ALL

      select distinct UUID  as joining_column,
      'LC' as security_group_bfa,

      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD currency
      LEFT JOIN @{server_name_fire}.@{schema_name}.FOTC_RD_MI_FLAT_DIMENSION_FOTC_BUSINESS_SEGMENT segment
      on currency.fotc_business_segment = segment.leaf
      LEFT JOIN
      (select * from
      @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where  dimension ='Global_Standard_Product' and dimension_tree_id ='CMB1') product
      on currency.fotc_product= product.code
      where segment.level_1= 'GSS10002' and segment.level_3='GSS30009'

      ;;

  }

  dimension: joining_column{
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.joining_column  ;;
  }

  dimension: security_group_model {
    hidden: yes
    type: string
    sql: ${TABLE}.security_group_bfa ;;
  }

  dimension: dimension_tree_id {
    hidden: yes
    type: string
    sql: ${TABLE}.dimension_tree_id ;;
  }

}
