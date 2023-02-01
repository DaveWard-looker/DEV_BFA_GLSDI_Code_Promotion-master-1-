view: fotc_dp_ce_gl_detail_output_current_period {
  required_access_grants: [explorer_security_bfa_all]
  label: "GL Detail Output Current Period"
  derived_table: {
  sql: select * from @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD;;
  # datagroup_trigger: BFA_glsdi_datagroup_current_year
}

######

  dimension: security_column {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${uuid};;
  }


  dimension: key {

    type: string
    hidden: yes
    sql: ${TABLE}.key1;;
  }



##############Format###############

  parameter: format {
    type: string
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


  ################### All Dimension

  ## Jim add mi_data_source dimension on 4Jan2023
  dimension: mi_data_source {
    type: string
    group_label: "Source"
    label: "MI Data Source"
    description: "MI Data Source"
    sql: ${TABLE}.mi_data_source ;;
  }


   dimension: account_or_deal_arrangement_local_number {
    type: string
    group_label: "Account"
    label: "Account or Deal Arrangement Local Number"
    description: "Account or Deal Arrangement Local Number"
    sql: ${TABLE}.account_or_deal_arrangement_local_number ;;
  }

  dimension: account_or_deal_arrangement_source_system_code {
    type: string
    group_label: "Account"
    label: "Account or Deal Arrangement Source System Code"
    description: "Account or Deal Arrangement Source System Code"
    sql: ${TABLE}.account_or_deal_arrangement_source_system_code ;;
  }

  dimension: account_or_deal_arrangement_suffix_number {
    type: string
    group_label: "Account"
    label: "Account or Deal Arrangement Suffix Number"
    description: "Account or Deal Arrangement Suffix Number"
    sql: ${TABLE}.account_or_deal_arrangement_suffix_number ;;
  }

  dimension: account_or_deal_identifier {
    type: string
    group_label: "Account"
    label: "Account or Deal Identifier"
    description: "Account or Deal Identifier"
    sql: ${TABLE}.account_or_deal_identifier ;;
  }

  dimension: account_or_deal_system_identifier {
    type: string
    group_label: "Account"
    label: "Account or Deal System Identifier"
    description: "Account or Deal System Identifier"
    sql: ${TABLE}.account_or_deal_system_identifier ;;
  }

  dimension_group: accounting  {
    group_label: "Accounting Date"
    description: "Reporting date in YYYY-MM-DD format - will be always be last day of month"
    type: time
   # view_label: "Accounting Date"
    timeframes: [

      date,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]

    convert_tz: no
    datatype: date
    sql: ${TABLE}.accounting_date ;;
  }

  dimension: month_year{
    # hidden: yes
    #view_label: "Accounting Date"
    group_label: "Accounting Date"
    description: "Reporting date in YYYY-MM-DD format - will be always be last day of month"
    #hidden: yes
    sql: ${accounting_date} ;;
    html: {{ linked_value | date: "%b %Y" }} ;;
  }



  # dimension: accounting_date_year {
  #   type: string
  #   sql: ${TABLE}.accounting_date_year ;;
  # }

  dimension: accounting_measurement_code {
    type: string
    group_label: "Accounting"
    label: "Accounting Measurement Code"
    description: "Accounting Measurement Code"
    sql: ${TABLE}.accounting_measurement_code ;;
  }

  dimension: accounting_regulation_category_code {
    type: string
    group_label: "Accounting"
    label: "Accounting Regulation Category Code"
    description: "Accounting Regulation Category Code"
    sql: ${TABLE}.accounting_regulation_category_code ;;
  }

  dimension: affiliate_chartfield_code {
    type: string
    group_label: "FTP Aggregated Attributes"
    label: "Affiliate Chartfield Code"
    sql: ${TABLE}.affiliate_chartfield_code ;;
  }

  dimension: allocation_basis_type {
    type: string
    group_label: "Allocation"
    label: "Allocation Basis Type"
    description: "Allocation Basis Type"
    sql: ${TABLE}.allocation_basis_type;;

  }
  dimension: allocation_group {
    group_label: "Allocation"
    label: "Allocation group"
    description: "Allocation group"
    type: string
    sql: ${TABLE}.allocation_group ;;
  }

  dimension: allocation_history {
    group_label: "Allocation"
    label: "Allocation History"
    description: "Allocation History"
    type: string
    sql: ${TABLE}.allocation_history ;;
  }


  dimension: allocation_posting_type {
    type: string
    group_label: "Allocation"
    label: "Allocation Posting Type"
    description: "Allocation Posting Type"
    sql: ${TABLE}.allocation_posting_type;;

  }

  dimension: allocation_set {
    type: string
    group_label: "Allocation"
    label: "Allocation Set"
    description: "Allocation Set"
    sql: ${TABLE}.allocation_set ;;

  }

  dimension: allocation_percentage {
    type: number
    group_label: "Allocation"
    label: "Allocation Percentage"
    description: "Allocation Percentage"

    sql: ${TABLE}.allocation_percentage/100 ;;
    # html: {% if format._parameter_value == "'M'" %}
    # {{allocation_percentage_m._linked_value}}
    # {% elsif format._parameter_value == "'K'" %}
    # {{allocation_percentage_k._linked_value}}
    # {% elsif format._parameter_value == "'B'" %}
    # {{allocation_percentage_b._linked_value}}
    # {% else %}
    # {{allocation_percentage_all._linked_value}}
    # {% endif %}
    #;;
    value_format: "#,##0.00%;(#,##0.00%)"

  }

  measure: allocation_percentage_all {
    type: sum
    hidden: yes
    group_label: "Allocation"
    label: "Allocation Percentage"
    description: "Allocation Percentage"
    sql: ${TABLE}.allocation_percentage/100 ;;
    value_format: "#,##0.00;(#,##0.00)"

  }

  measure: allocation_percentage_k {
    type: sum
    hidden: yes
    group_label: "Allocation"
    label: "Allocation Percentage"
    description: "Allocation Percentage"
    sql: ${TABLE}.allocation_percentage/100 ;;
    value_format: "#,##0.00,\" \""

  }
  measure: allocation_percentage_m {
    type: sum
    hidden: yes
    group_label: "Allocation"
    label: "Allocation Percentage"
    description: "Allocation Percentage"
    sql: ${TABLE}.allocation_percentage/100 ;;
    value_format: "#,##0.00,,\" \""

  }
  measure: allocation_percentage_b {
    type: sum
    hidden: yes
    group_label: "Allocation"
    label: "Allocation Percentage"
    description: "Allocation Percentage"
    sql: ${TABLE}.allocation_percentage/100 ;;
    value_format: "#,##0.00,,,\" \""

  }




  dimension: allocation_rule_id {
    type: string
    group_label: "Allocation"
    label: "Allocation Rule ID"
    description: "Allocation Rule ID"
    sql: ${TABLE}.allocation_rule_id ;;

  }



  dimension: grca_account_type{
    type: string
    group_label: "Account"
    label: "GRCA Account Type"
    description: "GRCA Account Type"
    sql: ${TABLE}.grca_account_type;;

  }






  # dimension: allocation_type {
  #   type: string
  #   group_label: "Allocation"
  #   label: "Allocation Type"
  #   description: "Allocation Type"
  #   sql: ${TABLE}.allocation_type ;;

  # }

  dimension: average_balance_grca_reconciliation_key {
    type: string
    group_label: "GRCA"
    label: "Average Balance GRCA Reconciliation key"
    description: "Average Balance GRCA Reconciliation key"
    sql: ${TABLE}.average_balance_grca_reconciliation_key ;;

  }

  dimension: average_balance_interest_type {
    type: string
    group_label: "Balance Type"
    label: "Average Balance Interest Type"
    sql: ${TABLE}.average_balance_interest_type ;;
  }

  dimension: balance_type {
    type: string
    group_label: "Balance Type"
    label: "Balance Type"
    sql: ${TABLE}.balance_type ;;
  }

  dimension: banking_or_trading_book_code {
    type: string
    group_label: "Banking"
    sql: ${TABLE}.banking_or_trading_book_code ;;
  }

  dimension: booking_entity_identifier {
    type: string
    group_label: "FTP Aggregated Attributes"
    sql: ${TABLE}.booking_entity_identifier ;;
  }

  # dimension: contra_entity {
  #   type: string
  #   group_label: "Banking"
  #   sql: ${TABLE}.contra_entity ;;
  # }

  dimension: correspondent_bank_or_branch_identifier_code {
    type: string
    group_label: "Banking"
    sql: ${TABLE}.correspondent_bank_or_branch_identifier_code ;;
  }

  dimension: cost_centre_identifier {
    type: string
    group_label: "FTP Aggregated Attributes"
    sql: ${TABLE}.cost_centre_identifier ;;
  }

  dimension: credit_facility_arrangement_local_number {
    type: string
    group_label: "Credit Facility"
    sql: ${TABLE}.credit_facility_arrangement_local_number ;;
  }

  dimension: credit_facility_arrangement_source_system_code {
    type: string
    group_label: "Credit Facility"
    sql: ${TABLE}.credit_facility_arrangement_source_system_code ;;
  }

  dimension: credit_facility_arrangement_suffix_number {
    type: string
    group_label: "Credit Facility"
    sql: ${TABLE}.credit_facility_arrangement_suffix_number ;;
  }

  dimension: credit_facility_system_identifier {
    type: string
    group_label: "Credit Facility"
    sql: ${TABLE}.credit_facility_system_identifier ;;
  }

  dimension: customer_type_chartfield_code {
    type: string
    group_label: "Customer Type"
    sql: ${TABLE}.customer_type_chartfield_code ;;
  }


  dimension: data_source {
    type: string
    group_label: "Source"
    sql: ${TABLE}.data_source;;
  }

  dimension: detailed_customer_type_chartfield_code {
    type: string
    group_label: "Customer Type"
    sql: ${TABLE}.detailed_customer_type_chartfield_code ;;
  }

  dimension: engine_source_code {
    type: string
    group_label: "Source"
    sql: ${TABLE}.engine_source_code ;;
  }

  dimension: fotc_business_segment {
    type: string
    group_label: "Segment"
    sql: ${TABLE}.fotc_business_segment ;;
  }

  dimension: fotc_product {
    type: string
    group_label: "Product"
    #primary_key: yes
    sql: ${TABLE}.fotc_product ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_01 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_01 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_02 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_02 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_03 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_03 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_04 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_04 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_05 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_05 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_06 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_06 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_07 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_07 ;;
  }

  dimension: fry14a_micro_reference_data_manual_key_08 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry14a_micro_reference_data_manual_key_08 ;;
  }

  dimension: fry14a_schedule_01 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_01 ;;
  }

  dimension: fry14a_schedule_02 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_02 ;;
  }

  dimension: fry14a_schedule_03 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_03 ;;
  }

  dimension: fry14a_schedule_04 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_04 ;;
  }

  dimension: fry14a_schedule_05 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_05 ;;
  }

  dimension: fry14a_schedule_06 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_06 ;;
  }

  dimension: fry14a_schedule_07 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_07 ;;
  }

  dimension: fry14a_schedule_08 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry14a_schedule_08 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_01 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_01 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_02 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_02 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_03 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_03 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_04 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_04 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_05 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_05 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_06 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_06 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_07 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_07 ;;
  }

  dimension: fry9c_micro_reference_data_manual_key_08 {
    type: string
    group_label: "Micro"
    sql: ${TABLE}.fry9c_micro_reference_data_manual_key_08 ;;
  }

  dimension: fry9c_schedule_01 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_01 ;;
  }

  dimension: fry9c_schedule_02 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_02 ;;
  }

  dimension: fry9c_schedule_03 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_03 ;;
  }

  dimension: fry9c_schedule_04 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_04 ;;
  }

  dimension: fry9c_schedule_05 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_05 ;;
  }

  dimension: fry9c_schedule_06 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_06 ;;
  }

  dimension: fry9c_schedule_07 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_07 ;;
  }

  dimension: fry9c_schedule_08 {
    type: string
    group_label: "Schedule"
    sql: ${TABLE}.fry9c_schedule_08 ;;
  }

  dimension: general_ledger_or_income_expenditure_account_identifier {
    type: string
    group_label: "General Ledger"
    sql: ${TABLE}.general_ledger_or_income_expenditure_account_identifier ;;
  }

  dimension: general_ledger_or_income_expenditure_account_type {
    type: string
    group_label: "General Ledger"
    sql: ${TABLE}.general_ledger_or_income_expenditure_account_type ;;
  }

  measure: gl_balance_amount_in_transaction_currency {
    type: sum
    label: "GL Balance Amount in Transaction Currency "
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_amount_in_transaction_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{gl_balance_amount_in_transaction_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{gl_balance_amount_in_transaction_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{gl_balance_amount_in_transaction_currency_b._linked_value}}
    {% else %}
    {{gl_balance_amount_in_transaction_currency_all._linked_value}}
    {% endif %}
    ;;
  }

  measure: gl_balance_amount_in_transaction_currency_all {
    type: sum
    hidden: yes
    label: "GL Balance Amount in Transaction Currency "
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_amount_in_transaction_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: gl_balance_amount_in_transaction_currency_b {
    type: sum
    hidden: yes
    label: "GL Balance Amount in Transaction Currency "
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_amount_in_transaction_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: gl_balance_amount_in_transaction_currency_m {
    type: sum
    hidden: yes
    label: "GL Balance Amount in Transaction Currency "
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_amount_in_transaction_currency ;;
    value_format: "#,##0.00,,\" \""
  }
  measure: gl_balance_amount_in_transaction_currency_k {
    type: sum
    hidden: yes
    label: "GL Balance Amount in Transaction Currency "
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_amount_in_transaction_currency ;;
    value_format: "#,##0.00,\" \""
  }

  dimension: gl_balance_amount_transaction_currency_code {
    type: string
    group_label: "GL Balance Currency Code"
    sql: ${TABLE}.gl_balance_amount_transaction_currency_code ;;
  }

    measure: gl_balance_in_reporting_currency {
    type: sum
    group_label: "GL Balance Amount"
    label: "GL Balance in Reporting Currency"
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    html: {% if format._parameter_value == "'M'" %}
      {{gl_balance_in_reporting_currency_m._linked_value}}
      {% elsif format._parameter_value == "'K'" %}
      {{gl_balance_in_reporting_currency_k._linked_value}}
      {% elsif format._parameter_value == "'B'" %}
      {{gl_balance_in_reporting_currency_b._linked_value}}
      {% else %}
      {{gl_balance_in_reporting_currency_all._linked_value}}
      {% endif %}
      ;;
  }

  measure: gl_balance_in_reporting_currency_all {
    type: sum
    hidden: yes
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: gl_balance_in_reporting_currency_b {
    type: sum
    hidden: yes
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    value_format: "#,##0.00,,,\" \""
  }

  measure: gl_balance_in_reporting_currency_m {
    type: sum
    hidden: yes
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    value_format: "#,##0.00,,\" \""
  }

  measure: gl_balance_in_reporting_currency_k {
    type: sum
    hidden: yes
    group_label: "GL Balance Amount"
    sql: ${TABLE}.gl_balance_in_reporting_currency ;;
    value_format: "#,##0.00,\" \""
  }

  dimension: gl_balance_reporting_currency_code {
    type: string
    group_label: "GL Balance Currency Code"
    sql: ${TABLE}.gl_balance_reporting_currency_code ;;

  }

  dimension: gl_source_system_identifier {
    type: string
    group_label: "Source"
    sql: ${TABLE}.gl_source_system_identifier ;;
  }

  dimension: grca_entity_identifier {
    type: string
    group_label: "FTP Aggregated Attributes"
    sql: ${TABLE}.grca_entity_identifier ;;
  }

  dimension: grca_entity_identifier_of_the_affiliate {
    type: string
    group_label: "FTP Aggregated Attributes"
    sql: ${TABLE}.grca_entity_identifier_of_the_affiliate ;;
  }

  dimension: grca_intercompany_indicator {
    type: string
    group_label: "GRCA"
    sql: ${TABLE}.grca_intercompany_indicator ;;
  }

  dimension: grca_reconciliation_key {
    type: string
    group_label: "GRCA"
    sql: ${TABLE}.grca_reconciliation_key ;;
  }

 dimension: half_year_to_date_average_balance_functional_currency_code {
    type: string
    group_label: "Average Balance Currency Code"
    #group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_functional_currency_code ;;
  }

  measure: half_year_to_date_average_balance_in_functional_currency {
    type: sum
    group_label: "Average Balance"
    sql: ${TABLE}.half_year_to_date_average_balance_in_functional_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{half_year_to_date_average_balance_in_functional_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{half_year_to_date_average_balance_in_functional_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{half_year_to_date_average_balance_in_functional_currency_b._linked_value}}
    {% else %}
    {{half_year_to_date_average_balance_in_functional_currency_all._linked_value}}
    {% endif %}
    ;;
    }

  measure: half_year_to_date_average_balance_in_functional_currency_all {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }
  measure: half_year_to_date_average_balance_in_functional_currency_b {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: half_year_to_date_average_balance_in_functional_currency_m {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,\" \""
  }
  measure: half_year_to_date_average_balance_in_functional_currency_k {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,\" \""
  }

  measure: half_year_to_date_average_balance_in_transaction_currency {
    type: sum
    group_label: "Average Balance"
    sql: ${TABLE}.half_year_to_date_average_balance_in_transaction_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{half_year_to_date_average_balance_in_transaction_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{half_year_to_date_average_balance_in_transaction_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{half_year_to_date_average_balance_in_transaction_currency_b._linked_value}}
    {% else %}
    {{half_year_to_date_average_balance_in_transaction_currency_all._linked_value}}
    {% endif %}
    ;;
  }

  measure: half_year_to_date_average_balance_in_transaction_currency_all {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }
  measure: half_year_to_date_average_balance_in_transaction_currency_b {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: half_year_to_date_average_balance_in_transaction_currency_m {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,\" \""
  }
  measure: half_year_to_date_average_balance_in_transaction_currency_k {
    type: sum
    hidden: yes
    group_label: "HYTD"
    sql: ${TABLE}.half_year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,\" \""
  }

  dimension: half_year_to_date_average_balance_transaction_currency_code {
    type: string
    group_label: "Average Balance Currency Code"
    sql: ${TABLE}.half_year_to_date_average_balance_transaction_currency_code ;;
  }

  dimension: ifrs9_stage {
    type: string
    # label: "IMPR Stge Aloc Code"
    group_label: "Allocation"
    sql: ${TABLE}.ifrs9_stage ;;
  }

  dimension: involved_party_identifier {
    type: string
    group_label: "Involved Party"
    sql: ${TABLE}.involved_party_identifier ;;
  }

  dimension: involved_party_identifier_type_code {
    type: string
    group_label: "Involved Party"
    sql: ${TABLE}.involved_party_identifier_type_code ;;
  }

  dimension: involved_party_system_identifier {
    type: string
    group_label: "Involved Party"
    sql: ${TABLE}.involved_party_system_identifier ;;
  }

  dimension: local_credit_facility_identifier {
    type: string
    group_label: "Local"
    sql: ${TABLE}.local_credit_facility_identifier ;;
  }

  dimension: local_customer_type_code {
    type: string
    group_label: "Local"
    sql: ${TABLE}.local_customer_type_code ;;
  }

  dimension: local_gl_reconciliation_key {
    type: string
    group_label: "Local"
    sql: ${TABLE}.local_gl_reconciliation_key ;;
  }

  dimension: local_source_system_product_code {
    type: string
    label: "Local Source System Product Code"
    description: "Local Source System Product Code"
    group_label: "Product"

    sql: ${TABLE}.local_source_system_product_code ;;
  }

  dimension: managed_brand{
    type: string
    group_label: "Brand/Managed Entity"
    label: "Managed Brand"
    description: "Managed Brand"
    sql: ${TABLE}.managed_brand;;

  }


  dimension: managed_contra_entity{
    type: string
    group_label: "Brand/Managed Entity"
    label: "Managed Contra Entity"
    description: "Managed Contra Entity"
    sql: ${TABLE}.managed_contra_entity;;

  }

  dimension: managed_entity {
    type: string
    group_label: "Brand/Managed Entity"
    sql: ${TABLE}.managed_entity ;;
  }

  dimension: mi_function_code {
    type: string
    group_label: "Function Code"
    sql: ${TABLE}.mi_function_code ;;
  }

  dimension: mi_global_business_code {
    type: string
    group_label: "Global Business / Segment"
    sql: ${TABLE}.mi_global_business_code ;;
  }

  dimension: mi_product_code {
    type: string
    group_label: "Product"
    sql: ${TABLE}.mi_product_code ;;
  }

  dimension: mica_code {
    type: string
    group_label: "Mica"
    label: "Mica Code"
    sql: ${TABLE}.mica_code ;;
  }

  dimension: mica_code_avbs {
    type: string
    label: "Mica Code AVBS"
    group_label: "Mica"
    sql: ${TABLE}.mica_code_avbs ;;
  }

  dimension: month_to_date_average_balance_functional_currency_code {
    type: number
    group_label: "Average Balance Currency Code"
    label: "MTD Average Balance Functional Currency Code"
    sql: ${TABLE}.month_to_date_average_balance_functional_currency_code ;;
  }

  measure: month_to_date_average_balance_in_functional_currency {
    type: sum
    group_label: "Average Balance"
    label: "MTD Average Balance in Functional Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_functional_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{month_to_date_average_balance_in_functional_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{month_to_date_average_balance_in_functional_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{month_to_date_average_balance_in_functional_currency_b._linked_value}}
    {% else %}
    {{month_to_date_average_balance_in_functional_currency_all._linked_value}}
    {% endif %}
    ;;
  }

  measure: month_to_date_average_balance_in_functional_currency_all {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Functional Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: month_to_date_average_balance_in_functional_currency_b {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Functional Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: month_to_date_average_balance_in_functional_currency_m {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Functional Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,\" \""
  }
  measure: month_to_date_average_balance_in_functional_currency_k {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Functional Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,\" \""
  }

  measure: month_to_date_average_balance_in_transaction_currency {
    type: sum
    group_label: "Average Balance"
    label: "MTD Average Balance in Transaction Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_transaction_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{month_to_date_average_balance_in_transaction_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{month_to_date_average_balance_in_transaction_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{month_to_date_average_balance_in_transaction_currency_b._linked_value}}
    {% else %}
    {{month_to_date_average_balance_in_transaction_currency_all._linked_value}}
    {% endif %}
    ;;
}

  measure: month_to_date_average_balance_in_transaction_currency_all {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Transaction Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: month_to_date_average_balance_in_transaction_currency_b {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Transaction Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,,\" \""
  }

  measure: month_to_date_average_balance_in_transaction_currency_m {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Transaction Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,\" \""
  }

  measure: month_to_date_average_balance_in_transaction_currency_k {
    type: sum
    hidden: yes
    group_label: "MTD"
    label: "MTD Average Balance in Transaction Currency"
    sql: ${TABLE}.month_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,\" \""
  }
  dimension: month_to_date_average_balance_transaction_currency_code {
    type: string
    group_label: "Average Balance Currency Code"
    label: "MTD Average Balance Transaction Currency_code"
    sql: ${TABLE}.month_to_date_average_balance_transaction_currency_code ;;
  }

  dimension: next_interest_reset_date {
    type: date
    group_label: "Product"
    sql: ${TABLE}.next_interest_reset_date ;;
  }

  # dimension_group: next_interest_reset_date   {
  #   group_label: "Next Interest Reset Date"
  #   description: "Next Interest Reset date in YYYY-MM-DD format - will be always be last day of month"
  #   type: time
  #   #view_label: "Accounting Date"
  #   timeframes: [

  #     date,
  #     month,
  #     month_name,
  #     month_num,
  #     quarter,
  #     year
  #   ]

  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.next_interest_reset_date ;;
  # }


  dimension: nominal_account_number {
    type: string
    label: "Nominal Account Number"
    group_label: "FTP Aggregated Attributes"
    sql: ${TABLE}.nominal_account_number ;;
  }

  dimension: original_cost_centre_identifier {
    type: string
    group_label: "Banking"
    sql: ${TABLE}.original_cost_centre_identifier ;;
  }

  dimension: product_chartfield_code {
    type: string
    group_label: "Product"
    label: "Product Chartfield code "
    sql: ${TABLE}.product_chartfield_code ;;
  }

  dimension: quarter_to_date_average_balance_functional_currency_code {
    type:string
    label: "QTD Average Balance Functional Currency Code"
    group_label: "Average Balance Currency Code"
    sql: ${TABLE}.quarter_to_date_average_balance_functional_currency_code ;;
  }

  measure: quarter_to_date_average_balance_in_functional_currency {
    type: sum
    group_label: "Average Balance"
    label: "QTD Average Balance in Functional Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_functional_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{quarter_to_date_average_balance_in_functional_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{quarter_to_date_average_balance_in_functional_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{quarter_to_date_average_balance_in_functional_currency_b._linked_value}}
    {% else %}
    {{quarter_to_date_average_balance_in_functional_currency_all._linked_value}}
    {% endif %}
    ;;
    }

  measure: quarter_to_date_average_balance_in_functional_currency_all {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Functional Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: quarter_to_date_average_balance_in_functional_currency_b {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Functional Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,,\" \""
  }

  measure: quarter_to_date_average_balance_in_functional_currency_m {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Functional Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,\" \""
  }

  measure: quarter_to_date_average_balance_in_functional_currency_k {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Functional Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,\" \""
  }

  measure: quarter_to_date_average_balance_in_transaction_currency {
    type: sum
    group_label: "Average Balance"
    label: "QTD Average Balance in Transaction Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_transaction_currency ;;
    html: {% if format._parameter_value == "'M'" %}
    {{quarter_to_date_average_balance_in_transaction_currency_m._linked_value}}
    {% elsif format._parameter_value == "'K'" %}
    {{quarter_to_date_average_balance_in_transaction_currency_k._linked_value}}
    {% elsif format._parameter_value == "'B'" %}
    {{quarter_to_date_average_balance_in_transaction_currency_b._linked_value}}
    {% else %}
    {{quarter_to_date_average_balance_in_transaction_currency_all._linked_value}}
    {% endif %}
    ;;
  }

  measure: quarter_to_date_average_balance_in_transaction_currency_all {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Transaction Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }
  measure: quarter_to_date_average_balance_in_transaction_currency_b {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Transaction Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: quarter_to_date_average_balance_in_transaction_currency_m {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Transaction Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,\" \""
  }
  measure: quarter_to_date_average_balance_in_transaction_currency_k {
    type: sum
    hidden: yes
    group_label: "QTD"
    label: "QTD Average Balance in Transaction Currency"
    sql: ${TABLE}.quarter_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,\" \""
  }

  dimension: quarter_to_date_average_balance_transaction_currency_code {
    type: string
    label: "QTD Average Balance Transaction Currency Code"
    group_label: "Average Balance Currency Code"
    sql: ${TABLE}.quarter_to_date_average_balance_transaction_currency_code ;;
  }

  dimension: s18_custom1 {
    type: string
    label: "S18 Custom1"
    group_label: "Sarace Derived Dimensions"
    sql: ${TABLE}.s18_custom1 ;;
  }

  dimension: s18_icp {
    type: string
    label: "S18 ICP"
    group_label: "Sarace Derived Dimensions"
    sql: ${TABLE}.s18_icp ;;
  }

  dimension: repair_group {
    type: string
    label: "Repair Group"
    group_label: "Repair"
    sql: ${TABLE}.repair_group ;;
  }

  dimension: repair_name {
    type: string
    label: "Repair Name"
    group_label: "Repair"
    sql: ${TABLE}.repair_name ;;
  }

  dimension: repair_posting_type{
    type: string
    label: "Repair Posting Type"
    group_label: "Repair"
    sql: ${TABLE}.repair_posting_type ;;
  }



  dimension: source_chartfield_code {
    type: string
    group_label: "Source"
    sql: ${TABLE}.source_chartfield_code ;;
  }

  dimension: transfer_pricing_curve {
    type: string
    group_label: "Product"
    label: "Transfer Pricing Curve"
    description: "Transfer Pricing Curve"
    sql: ${TABLE}.transfer_pricing_curve ;;
  }

  dimension: uuid {
    type: string
    group_label: "UUID"
    label: "UUID"
    description: "UUID"
    sql: ${TABLE}.uuid ;;
  }

  dimension: year_to_date_average_balance_functional_currency_code {
    type: string
    group_label: "YTD"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_functional_currency_code ;;
  }

    measure: year_to_date_average_balance_in_functional_currency {
    type: sum
    group_label: "Average Balance"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_functional_currency ;;
    html: {% if format._parameter_value == "'M'" %}
      {{year_to_date_average_balance_in_functional_currency_m._linked_value}}
      {% elsif format._parameter_value == "'K'" %}
      {{year_to_date_average_balance_in_functional_currency_k._linked_value}}
      {% elsif format._parameter_value == "'B'" %}
      {{year_to_date_average_balance_in_functional_currency_b._linked_value}}
      {% else %}
      {{year_to_date_average_balance_in_functional_currency_all._linked_value}}
      {% endif %}
      ;;
  }

  measure: year_to_date_average_balance_in_functional_currency_all {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: year_to_date_average_balance_in_functional_currency_b {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,,\" \""
  }

  measure: year_to_date_average_balance_in_functional_currency_m {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,,\" \""
  }

  measure: year_to_date_average_balance_in_functional_currency_k {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Functional Currency"
    description: "YTD Average Balance in Functional Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_functional_currency ;;
    value_format: "#,##0.00,\" \""
  }

    measure: year_to_date_average_balance_in_transaction_currency {
    type: sum
    group_label: "Average Balance"
    label: "YTD Average Balance in Transaction Currency"
    description: "YTD Average Balance in Transaction Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_transaction_currency ;;
      html: {% if format._parameter_value == "'M'" %}
      {{year_to_date_average_balance_in_transaction_currency_m._linked_value}}
      {% elsif format._parameter_value == "'K'" %}
      {{year_to_date_average_balance_in_transaction_currency_k._linked_value}}
      {% elsif format._parameter_value == "'B'" %}
      {{year_to_date_average_balance_in_transaction_currency_b._linked_value}}
      {% else %}
      {{year_to_date_average_balance_in_transaction_currency_all._linked_value}}
      {% endif %}
      ;;
  }



  measure: year_to_date_average_balance_in_transaction_currency_all {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Transaction Currency"
    description: "YTD Average Balance in Transaction Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00;(#,##0.00)"
  }

  measure: year_to_date_average_balance_in_transaction_currency_b {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Transaction Currency"
    description: "YTD Average Balance in Transaction Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,,\" \""
  }
  measure: year_to_date_average_balance_in_transaction_currency_m {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Transaction Currency"
    description: "YTD Average Balance in Transaction Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,,\" \""
  }

  measure: year_to_date_average_balance_in_transaction_currency_k {
    type: sum
    hidden: yes
    group_label: "YTD"
    label: "YTD Average Balance in Transaction Currency"
    description: "YTD Average Balance in Transaction Currency"
    sql: ${TABLE}.year_to_date_average_balance_in_transaction_currency ;;
    value_format: "#,##0.00,\" \""
  }

   dimension: year_to_date_average_balance_transaction_currency_code {
    label: "Year To Date Average Balance Transaction Currency Code"
    description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "YTD"
    type: string
    sql: ${TABLE}.year_to_date_average_balance_transaction_currency_code ;;
  }
  dimension: AUDIT_ID_FOTC_BUSINESS_SEGMENT_SIMPLE {
    label: "Audit ID FOTC Business Segment Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_FOTC_BUSINESS_SEGMENT_SIMPLE ;;
  }

  dimension: AUDIT_ID_FOTC_PRODUCT_SIMPLE {
    label: "Audit ID FOTC Product Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_FOTC_PRODUCT_SIMPLE ;;
  }

  dimension: AUDIT_ID_MI_FUNCTION_CODE_SIMPLE {
    label: "Audit ID MI Function Code Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MI_FUNCTION_CODE_SIMPLE ;;
  }

  dimension: AUDIT_ID_MICA_CODE_SIMPLE {
    label: "Audit ID MICA Code Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MICA_CODE_SIMPLE ;;
  }

  dimension: AUDIT_ID_MICA_CODE_AVBS_SIMPLE {
    label: "Audit ID MICA Code AVBS Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MICA_CODE_AVBS_SIMPLE ;;
  }

  dimension: AUDIT_ID_GRCA_INTERCOMPANY_COMPLEX {
    label: "Audit ID GRCA Intercompany Complex"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_GRCA_INTERCOMPANY_COMPLEX ;;
  }

  dimension: AUDIT_ID_MANAGED_CONTRA_BRAND_COMPLEX {
    label: "Audit ID Managed Contra Brand Complex"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MANAGED_CONTRA_BRAND_COMPLEX;;
  }

  dimension: AUDIT_ID_S18_ICP_COMPLEX {
    label: "Audit ID S18 ICP Complex"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_S18_ICP_COMPLEX;;
  }

  dimension: AUDIT_ID_MICA_CODE_FTP_COMPLEX {
    label: "Audit ID MICA Code FTP Complex"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MICA_CODE_FTP_COMPLEX;;
  }

  dimension: AUDIT_ID_MI_GLOBAL_BUSINESS_CODE_SIMPLE {
    label: "Audit ID MI Global Business Code Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MI_GLOBAL_BUSINESS_CODE_SIMPLE;;
  }

  dimension: AUDIT_ID_MI_PRODUCT_CODE_SIMPLE{
    label: "Audit ID MI Product Code Simple"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_MI_PRODUCT_CODE_SIMPLE;;
  }

  dimension: AUDIT_ID_S18_CUSTOM1_COMPLEX {
    label: "Audit ID S18 Custom1 Complex"
    #description: "Year To Date Average Balance Transaction Currency Code"
    group_label: "Audit"
    type: string
    sql: ${TABLE}.AUDIT_ID_S18_CUSTOM1_COMPLEX;;
  }


dimension: allocation_source_component {
  label: "Allocation Source Component"
  group_label: "Allocation"
  type: string
  sql: ${TABLE}.allocation_source_component ;;
}

dimension: audit_id_s18_custom1_complex {
  label: "Audit Id S18 Custom Complex"
  group_label: "Audit"
  type: string
  sql: ${TABLE}.audit_id_s18_custom1_complex ;;
}

  dimension: journal_id {
    label: "Journal Id"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.journal_id ;;
  }

  dimension: journal_line_number {
    label: "Journal Line Number"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.journal_line_number ;;
  }

  dimension: journal_description {
    label: "Journal Description"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.journal_description ;;
  }

  dimension: adjustment_type {
    label: "Adjustment Type"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.adjustment_type ;;
  }
  dimension: pre_allocation_engine {
    label: "Pre Allocation Engine"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.pre_allocation_engine ;;
  }

  dimension: date_posted {
    label: "Date Posted"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.date_posted ;;
  }


  dimension: posted_by {
    label: "Posted By"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.posted_by ;;
  }

  dimension: date_approved {
    label: "Date Approved"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.date_approved;;
  }

  dimension: approved_by {
    label: "Approved By"
    group_label: "Adjustments"
    type: string
    sql: ${TABLE}.approved_by;;
  }

  dimension: managed_product {
    label: "Managed Product"
    group_label: "Brand/Managed Entity"
    type: string
    sql: ${TABLE}.managed_product;;
  }

  dimension: mi_channel {
    type: string
    group_label: "Product"
    sql: ${TABLE}.mi_channel ;;
  }


  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
