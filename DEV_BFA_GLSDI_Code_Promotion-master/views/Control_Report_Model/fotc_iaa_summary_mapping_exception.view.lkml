#Create view from Becky on 23Dec2022

view: fotc_iaa_summary_mapping_exception {
  label: "MAPPING EXCEPTION REPORT"
  required_access_grants: [explorer_security_bfa_all]
  sql_table_name: @{server_name_fine}.@{schema_name}.FOTC_IAA_SUMMARY_MAPPING_EXCEPTION;;

  #Added for drill fields from Becky on 06Jan2023
  set: MICA {
    fields:[MICA_CONTROL_REPORT.code,MICA_CONTROL_REPORT.level_0,MICA_CONTROL_REPORT.level_1,MICA_CONTROL_REPORT.level_2,MICA_CONTROL_REPORT.level_3,MICA_CONTROL_REPORT.level_4,MICA_CONTROL_REPORT.level_5,MICA_CONTROL_REPORT.level_6,MICA_CONTROL_REPORT.level_7,MICA_CONTROL_REPORT.level_8,MICA_CONTROL_REPORT.level_9,MICA_CONTROL_REPORT.level_10,MICA_CONTROL_REPORT.level_11,MICA_CONTROL_REPORT.level_12,MICA_CONTROL_REPORT.level_13,MICA_CONTROL_REPORT.level_14,MICA_CONTROL_REPORT.level_15]
  }
  set: MICA_Drill_Report {
    fields: [target, accounting_date,grca_entity_identifier,booking_entity_identifier,accounting_regulation_category_code,mi_data_source,mica_code,cost_centre_identifier,nominal_account_number,grca,ftp_source,fotc_product,
      mi_product,mi_global_business,gl_count,cost_centre_identifier_1,customer_type_chartfield_code,product_chartfield_code,nominal_account_number_1,transfer_pricing_curve,next_interest_reset_date,fotc_product_1,fotc_business_segment_1,
      grca_reconciliation_key_1,average_balance_interest_type,affiliate_chartfield_code,
      booking_entity_identifier_1,mi_function_code,mi_global_business_code,ifrs9_stage,grca_intercompany_indicator,grca_entity_identifier_1,grca_entity_identifier_of_the_affiliate,grca_account_type,mica_code_1,mi_gl_balance_report_currency]
  }

#Add parameter for currency unit control from Becky on 04Jan2023
  parameter: format {
    type: string
    hidden: no
    allowed_value: {
      label: "Millions"
      value: "M"
    }
    allowed_value: {
      label: "Thousands"
      value: "K"
    }
    allowed_value: {
      label: "Billions"
      value: "B"
    }

    allowed_value: {
      label: "ALL"
      value: "X"
    }
  }

  dimension_group: accounting {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.accounting_date ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accounting Regulation Category Code" in Explore.

  dimension: accounting_regulation_category_code {
    type: string
    sql: ${TABLE}.accounting_regulation_category_code ;;
  }

  dimension: affiliate_chartfield_code {
    type: string
    sql: ${TABLE}.affiliate_chartfield_code ;;
  }

  dimension: average_balance_interest_type {
    type: string
    sql: ${TABLE}.average_balance_interest_type ;;
  }

  dimension: booking_entity_identifier {
    type: string
    sql: ${TABLE}.booking_entity_identifier ;;
  }

  dimension: booking_entity_identifier_1 {
    type: string
    sql: ${TABLE}.booking_entity_identifier_1 ;;
  }

  dimension: cost_centre_identifier {
    type: string
    sql: ${TABLE}.cost_centre_identifier ;;
  }

  dimension: cost_centre_identifier_1 {
    type: string
    sql: ${TABLE}.cost_centre_identifier_1 ;;
  }

  dimension: customer_type_chartfield_code {
    type: string
    sql: ${TABLE}.customer_type_chartfield_code ;;
  }

  dimension: mi_global_business {
    type: string
    sql: ${TABLE}.fotc_business_segment ;;
  }

  dimension: fotc_business_segment_1 {
    type: string
    sql: ${TABLE}.fotc_business_segment_1 ;;
  }

  dimension: fotc_product {
    type: string
    sql: ${TABLE}.fotc_product ;;
  }

  dimension: fotc_product_1 {
    type: string
    sql: ${TABLE}.fotc_product_1 ;;
  }

#Start- Change dimension to measure, Add value format and currency unit control from Becky on 04Jan2023
  measure: mi_gl_balance_report_currency {
    type: sum
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{mi_gl_balance_report_currency_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{mi_gl_balance_report_currency_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{mi_gl_balance_report_currency_b._linked_value}}
          {% else %}
          {{mi_gl_balance_report_currency_all._linked_value}}
          {% endif %}
          ;;
#Add drill down from Becky on 06Jan2023
      drill_fields: [MICA_Drill_Report*]
    }

    measure: mi_gl_balance_report_currency_b {
      label: "mi_gl_balance_report_currency"
      hidden: yes
      type: sum
      sql: ${TABLE}.gl_balance_in_reporting_currency ;;
      value_format: "#,##0.00,,,\" \""
    }

    measure: mi_gl_balance_report_currency_m {
      label: "mi_gl_balance_report_currency"
      hidden: yes
      type: sum
      sql: ${TABLE}.gl_balance_in_reporting_currency ;;
      value_format: "#,##0.00,,\" \""
    }

    measure: mi_gl_balance_report_currency_k {
      label: "mi_gl_balance_report_currency"
      hidden: yes
      type: sum
      sql: ${TABLE}.gl_balance_in_reporting_currency ;;
      value_format: "#,##0.00,\" \""
    }
    measure: mi_gl_balance_report_currency_all {
      label: "mi_gl_balance_report_currency"
      hidden: yes
      type: sum
      sql: ${TABLE}.gl_balance_in_reporting_currency ;;
      value_format: "#,##0.00"
    }
    #End of Add value format and currency unit control from Becky on 04Jan2023


    dimension: gl_count {
      type: number
      #hidden: yes
      sql: ${TABLE}.gl_count ;;
    }

    # measure: gl_count_sum {
    #   type:  sum
    #   sql: ${TABLE}.gl_count ;;

    # }


    # measure: gl_count_count {
    #   type:  count
    #   sql: ${TABLE}.gl_count ;;

    # }

    # measure: gl_count_1 {
    #   type: number
    #   sql: ${gl_count_sum}/${gl_count_count} ;;
    #   #value_format: "###0"
    # }

    dimension: ftp_source {
      type: string
      sql: ${TABLE}.source_chartfield_code ;;

    }

    dimension: grca_account_type {
      type: string
      sql: ${TABLE}.grca_account_type ;;
    }

    dimension: grca_entity_identifier {
      type: string
      sql: ${TABLE}.grca_entity_identifier ;;
    }

    dimension: grca_entity_identifier_1 {
      type: string
      sql: ${TABLE}.grca_entity_identifier_1 ;;
    }

    dimension: grca_entity_identifier_of_the_affiliate {
      type: string
      sql: ${TABLE}.grca_entity_identifier_of_the_affiliate ;;
    }

    dimension: grca_intercompany_indicator {
      type: string
      sql: ${TABLE}.grca_intercompany_indicator ;;
    }

    dimension: grca {
      type: string
      sql: ${TABLE}.grca_reconciliation_key ;;
    }

    dimension: grca_reconciliation_key_1 {
      type: string
      sql: ${TABLE}.grca_reconciliation_key_1 ;;
    }

    dimension: ifrs9_stage {
      type: string
      sql: ${TABLE}.ifrs9_stage ;;
    }

    dimension: mi_data_source {
      type: string
      sql: ${TABLE}.mi_data_source ;;
    }

    dimension: mi_function_code {
      type: string
      sql: ${TABLE}.mi_function_code ;;
    }

    dimension: mi_global_business_code {
      type: string
      sql: ${TABLE}.mi_global_business_code ;;
    }

    dimension: mi_product {
      type: string
      sql: ${TABLE}.mi_product_code ;;
    }

    dimension: mica_code {
      label: "MICA Code(Leaf)"
      type: string
      sql: ${TABLE}.mica_code ;;
      drill_fields: [MICA*]
    }

    dimension: mica_code_1 {
      type: string
      sql: ${TABLE}.mica_code_1 ;;
    }

#change date to string from Becky on 10Jan2023
    dimension: next_interest_reset_date {
      type: string
      sql: ${TABLE}.next_interest_reset_date ;;
    }

    dimension: nominal_account_number {
      type: string
      #primary_key: yes
      sql: ${TABLE}.nominal_account_number ;;
    }

    dimension: nominal_account_number_1 {
      type: string
      sql: ${TABLE}.nominal_account_number_1 ;;
    }

    dimension: product_chartfield_code {
      type: string
      sql: ${TABLE}.product_chartfield_code ;;
    }

    dimension: region {
      type: string
      sql: ${TABLE}.region ;;
    }

    dimension: target {
      type: string
      sql: ${TABLE}.target ;;
    }

    dimension: transfer_pricing_curve {
      type: string
      sql: ${TABLE}.transfer_pricing_curve ;;
    }

    measure: count {
      type: count
      drill_fields: []
    }
  }
