view: allocation_group {
  label: "Allocation Group"

  derived_table: {
    sql: select rule_name,uuid,sum(balance_contra) as balance_contra ,
    sum(balance_source) as balance_source ,sum(balance_target) as balance_target from
      (with allocation_1 as(select allocation_group,allocation_posting_type,uuid,
      split(allocation_rule_id,'||')[offset(0)] as Rule_Name,split(allocation_rule_id,'||')[offset(1)] as Rule_ID_No,
      allocation_set,sum(gl_balance_in_reporting_currency) as Total_Balance
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD
      where allocation_group like 'Business to Business%'
      group by 1,2,3,4,5,6

      union all

      select allocation_group,'SOURCE' as allocation_posting_type,uuid,
      split(allocation_source_component,'||')[offset(0)] as Rule_Name,split(allocation_source_component,'||')[offset(1)] as Rule_ID_No,
      allocation_set,sum(gl_balance_in_reporting_currency) as Total_Balance
      FROM @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD
      where allocation_group like 'Business to Business%'
      and allocation_source_component!=''
      and allocation_posting_type='TARGET'
      group by 1,2,3,4,5,6),

      allocation_2 as(select Rule_Name,allocation_posting_type,Total_Balance,uuid from allocation_1)

      select * from allocation_2
      pivot (sum(Total_Balance) as Balance
      for allocation_posting_type in ('CONTRA','SOURCE','TARGET'))) a
      group by 1,2
      ;;
  }

  dimension: rule_name {
    label: "Rule Name"
    type: string
    sql: ${TABLE}.rule_name ;;
  }


  dimension: uuid {
    label: "UUID"
    type: string
    primary_key: yes
    hidden: yes
    sql:  ${TABLE}.uuid ;;

  }

  measure: balance_contra {
    label: "Total Balance Contra"
    type: sum_distinct
     sql_distinct_key: ${uuid} ;;
    sql:  ${TABLE}.balance_contra;;
    value_format: "###0.00"
  }

  # measure: balance_contra {
  #   type: number
  #   sql: sum(${balance_contra1})/ count(${uuid}) ;;
  #   group_item_label: "uuid"
  #   group_label: "uuid"
  #   value_format: "###0.00"
  # }


  measure: balance_source {
    label: "Total Balance Source"
    type: sum_distinct
    sql_distinct_key: ${uuid} ;;
    sql:  ${TABLE}.balance_source ;;
    value_format: "###0.00"
  }


  measure: balance_target {
    label: "Total Balance Target"
    type: sum_distinct
    sql_distinct_key: ${uuid} ;;
    sql:  ${TABLE}.balance_Target ;;
    value_format: "###0.00"
  }


}
