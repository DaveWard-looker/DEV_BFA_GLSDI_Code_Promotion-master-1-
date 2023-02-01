# The name of this view in Looker is "Fotc Rd Bfa Mia Results Preview Prior Submission"
view: fotc_rd_bfa_mia_results_preview_prior_submission {
  label: "BFA MIA Result Preview Prior Submission"
  required_access_grants: [explorer_security_bfa_all]

  sql_table_name: @{server_name_fine}.@{schema_name}.FOTC_RD_BFA_MIA_RESULTS_PREVIEW_PRIOR_SUBMISSION
    ;;

  set: MICA {
    fields:[MICA_CONTROL_REPORT.code,MICA_CONTROL_REPORT.level_0,MICA_CONTROL_REPORT.level_1,MICA_CONTROL_REPORT.level_2,MICA_CONTROL_REPORT.level_3,MICA_CONTROL_REPORT.level_4,MICA_CONTROL_REPORT.level_5,MICA_CONTROL_REPORT.level_6,MICA_CONTROL_REPORT.level_7,MICA_CONTROL_REPORT.level_8,MICA_CONTROL_REPORT.level_9,MICA_CONTROL_REPORT.level_10,MICA_CONTROL_REPORT.level_11,MICA_CONTROL_REPORT.level_12,MICA_CONTROL_REPORT.level_13,MICA_CONTROL_REPORT.level_14,MICA_CONTROL_REPORT.level_15]
  }

  set: MICA_Drill_Report {
    fields: [entity,accounting_treatment, mica,global_business,gl_detail_sdi_amount,fotc_mia_extract_amount, difference, entity_inclusion,data_exclusion,  known_difference_total,check_variance]
  }

  set: Entity {
     fields: [fotc_rd_mi_flat_dimension_mi_entity_control.leaf,fotc_rd_mi_flat_dimension_mi_entity_control.level_0,fotc_rd_mi_flat_dimension_mi_entity_control.level_1,fotc_rd_mi_flat_dimension_mi_entity_control.level_2,fotc_rd_mi_flat_dimension_mi_entity_control.level_3,fotc_rd_mi_flat_dimension_mi_entity_control.level_4,fotc_rd_mi_flat_dimension_mi_entity_control.level_5,fotc_rd_mi_flat_dimension_mi_entity_control.level_6,fotc_rd_mi_flat_dimension_mi_entity_control.level_7,fotc_rd_mi_flat_dimension_mi_entity_control.level_8,fotc_rd_mi_flat_dimension_mi_entity_control.level_9,fotc_rd_mi_flat_dimension_mi_entity_control.level_10,fotc_rd_mi_flat_dimension_mi_entity_control.level_11,fotc_rd_mi_flat_dimension_mi_entity_control.level_12,fotc_rd_mi_flat_dimension_mi_entity_control.level_13,fotc_rd_mi_flat_dimension_mi_entity_control.level_14,fotc_rd_mi_flat_dimension_mi_entity_control.level_15]
  }
  parameter: format {
    type: string
    hidden: yes
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

  dimension: accounting_treatment {
    label: "Accounting Treatment"
    description: "This column will show values coming from the column Accounting_regulation_category_code coming from the Standardized GL Detail SDI, where value = ‘IFRS’"
    type: string
    sql: ${TABLE}.Accounting_Treatment ;;
  }


  dimension: entity {
    label: "Legal Entity"
    description: "This column will show value coming from the union of the three columns: grca_entity_identifier, managed_entity,contra_entity coming from the Standardized GL Detail SDI"
    type: string
    sql: ${TABLE}.Entity ;;
    drill_fields: [Entity*]
  }



  dimension: global_business {

    label: "Global Business"
    description: "This column will show values coming from: mi_global_business_code column from the Standardized GL Detail SDI"
    type: string
    sql: ${TABLE}.Global_Business ;;
  }


  dimension: mica {
    label: "MICA Code"
    description: "This column will show values coming from the union of the two columns:  mica_code and mica_code_avbs coming from the Standardized GL Detail SDI."
    type: string
    sql: ${TABLE}.MICA ;;
    drill_fields: [MICA*]
  }



  measure: difference {
    label: "Difference"
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc MIA Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.difference  ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{difference_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{difference_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{difference_b._linked_value}}
          {% else %}
          {{difference_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]
  }
  measure: difference_b {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc MIA Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: difference_m {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc MIA Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }


  measure: difference_k {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc MIA Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }
  measure: difference_all {
    label: "Difference"
    hidden: yes
    description: "This column should show the difference between the amount in the ‘GL Detail SDI- Amount (YTD in reporting ccy)’ column and the corrispondent amount in the ‘Fotc MIA Extract - Amount (YTD in reporting ccy)’, for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Difference ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }

  measure: data_exclusion {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts"
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{data_exclusion_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{data_exclusion_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{data_exclusion_b._linked_value}}
          {% else %}
          {{data_exclusion_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]
  }


  measure: data_exclusion_b {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts"
    type: sum
    hidden: yes
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }


  measure: data_exclusion_m {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts"
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }


  measure: data_exclusion_k {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts"
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: data_exclusion_all {
    label: "Data Exclusion"
    description: "This column should show the difference  between the amount in the ‘Value’,  before and after the data exclusion logic has been applied. This column shows the impact that the data exclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts"
    hidden: yes
    type: sum
    sql: ${TABLE}.Data_Exclusion ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }

  measure: check_variance {
    label: "Variance"
    description: "This column should show the difference between the amount in the ‘Difference (1)’ column and the corrispondent amount in the ‘Total (2)’ column. If there is a difference, it will flag an issue with processing the data from the GL Detail SDI and the MIA extract table. "
    type: sum
    sql: ${TABLE}.check_variance ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{check_variance_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{check_variance_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{check_variance_b._linked_value}}
          {% else %}
          {{check_variance_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]
  }

  measure: check_variance_b {
    label: "Variance"
    description: "This column should show the difference between the amount in the ‘Difference (1)’ column and the corrispondent amount in the ‘Total (2)’ column. If there is a difference, it will flag an issue with processing the data from the GL Detail SDI and the MIA extract table. "
    type: sum
    hidden: yes
    sql: ${TABLE}.Check_Variance ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: check_variance_m {
    label: "Variance"
    description: "This column should show the difference between the amount in the ‘Difference (1)’ column and the corrispondent amount in the ‘Total (2)’ column. If there is a difference, it will flag an issue with processing the data from the GL Detail SDI and the MIA extract table. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Check_Variance ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: check_variance_k {
    label: "Variance"
    description: "This column should show the difference between the amount in the ‘Difference (1)’ column and the corrispondent amount in the ‘Total (2)’ column. If there is a difference, it will flag an issue with processing the data from the GL Detail SDI and the MIA extract table. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Check_Variance ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: check_variance_all {
    label: "Variance"
    description: "This column should show the difference between the amount in the ‘Difference (1)’ column and the corrispondent amount in the ‘Total (2)’ column. If there is a difference, it will flag an issue with processing the data from the GL Detail SDI and the MIA extract table. "
    hidden: yes
    type: sum
    sql: ${TABLE}.Check_Variance ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }

  measure: entity_inclusion {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amounts in the ‘Value’ column,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts."
    type: sum
    sql: ${TABLE}.entity_inclusion ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{entity_inclusion_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{entity_inclusion_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{entity_inclusion_b._linked_value}}
          {% else %}
          {{entity_inclusion_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]
  }

  measure: entity_inclusion_b {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amounts in the ‘Value’ column,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: entity_inclusion_m {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amounts in the ‘Value’ column,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: entity_inclusion_k {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amounts in the ‘Value’ column,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }
  measure: entity_inclusion_all {
    label: "Entity Inclusion"
    description: "This column should show the difference between the amounts in the ‘Value’ column,  before and after the entity inclusion logic has been applied. This column shows the impact that the Entity inclusion logic has on the final numbers. Therfore it can explain/justify to the user the differences between GL Detail SDI and MIA extract tables amounts."
    hidden: yes
    type: sum
    sql: ${TABLE}.Entity_Inclusion ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }

  measure: known_difference_total {
    label: "Total"
    description: "This column should shows the sum of the amounts in ‘Entity Inclusion’ and ‘Data Inclusion’ columns for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Known_Difference_Total ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{known_difference_total_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{known_difference_total_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{known_difference_total_b._linked_value}}
          {% else %}
          {{known_difference_total_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]

  }

  measure: known_difference_total_b {
    label: "Total"
    description: "This column should shows the sum of the amounts in ‘Entity Inclusion’ and ‘Data Inclusion’ columns for each unique combination of entity,accounting treatment and MICA."
    type: sum
    hidden: yes
    sql: ${TABLE}.Known_Difference_Total ;;
    #sql: ${known_difference_total} ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: known_difference_total_m {
    label: "Total"
    description: "This column should shows the sum of the amounts in ‘Entity Inclusion’ and ‘Data Inclusion’ columns for each unique combination of entity,accounting treatment and MICA."
    hidden: yes
    type: sum
    sql: ${TABLE}.Known_Difference_Total ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: known_difference_total_k {
    label: "Total"
    hidden: yes
    description: "This column should shows the sum of the amounts in ‘Entity Inclusion’ and ‘Data Inclusion’ columns for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Known_Difference_Total ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: known_difference_total_all {
    label: "Total"
    hidden: yes
    description: "This column should shows the sum of the amounts in ‘Entity Inclusion’ and ‘Data Inclusion’ columns for each unique combination of entity,accounting treatment and MICA."
    type: sum
    sql: ${TABLE}.Known_Difference_Total ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }

  measure: fotc_mia_extract_amount {
    label: "Fotc MIA Extract_Amount"
    description: "This column will show values coming from ‘Value’ of the MIA extract table. These amounts should be aggregated or grouped by the columns MI_Entity, MI_MICA from the the MIA extract table. Please notice that some combinations will have GL Detail SDI amounts but not an equivalent one coming from the MIA extract tables. For these cases please default to 0."
    type: sum
    sql: ${TABLE}.Fotc_MIA_Extract_Amount ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{fotc_mia_extract_amount_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{fotc_mia_extract_amount_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{fotc_mia_extract_amount_b._linked_value}}
          {% else %}
          {{fotc_mia_extract_amount_all._linked_value}}
          {% endif %}

      ;;
    drill_fields: [MICA_Drill_Report*]

  }

  measure: fotc_mia_extract_amount_b {
    label: "Fotc MIA Extract_Amount"
    description: "This column will show values coming from ‘Value’ of the MIA extract table. These amounts should be aggregated or grouped by the columns MI_Entity, MI_MICA from the the MIA extract table. Please notice that some combinations will have GL Detail SDI amounts but not an equivalent one coming from the MIA extract tables. For these cases please default to 0."
    type: sum
    hidden: yes
    sql: ${TABLE}.Fotc_MIA_Extract_Amount ;;
    #sql: ${fotc_saracen_extract_amount} ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: fotc_mia_extract_amount_m {
    label: "Fotc MIA Extract_Amount"
    description: "This column will show values coming from ‘Value’ of the MIA extract table. These amounts should be aggregated or grouped by the columns MI_Entity, MI_MICA from the the MIA extract table. Please notice that some combinations will have GL Detail SDI amounts but not an equivalent one coming from the MIA extract tables. For these cases please default to 0."
    hidden: yes
    type: sum
    sql: ${TABLE}.Fotc_MIA_Extract_Amount ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: fotc_mia_extract_amount_k {
    label: "Fotc MIA Extract_Amount"
    hidden: yes
    description: "This column will show values coming from ‘Value’ of the MIA extract table. These amounts should be aggregated or grouped by the columns MI_Entity, MI_MICA from the the MIA extract table. Please notice that some combinations will have GL Detail SDI amounts but not an equivalent one coming from the MIA extract tables. For these cases please default to 0."
    type: sum
    sql: ${TABLE}.Fotc_MIA_Extract_Amount ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: fotc_mia_extract_amount_all {
    label: "Fotc MIA Extract_Amount"
    hidden: yes
    description: "This column will show values coming from ‘Value’ of the MIA extract table. These amounts should be aggregated or grouped by the columns MI_Entity, MI_MICA from the the MIA extract table. Please notice that some combinations will have GL Detail SDI amounts but not an equivalent one coming from the MIA extract tables. For these cases please default to 0."
    type: sum
    sql: ${TABLE}.Fotc_MIA_Extract_Amount ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]

  }
  measure: gl_detail_sdi_amount {
    label: "Fotc Standardised GL Detail_Amount"
    description: "This column will show values coming from gl_balance_in_reporting_currency from the Standardized GL Detail SDI. These amounts should be aggregated or grouped by columns"
    type: sum
    sql: ${TABLE}.GL_Detail_SDI_Amount ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{gl_detail_sdi_amount_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{gl_detail_sdi_amount_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{gl_detail_sdi_amount_b._linked_value}}
          {% else %}
          {{gl_detail_sdi_amount_all._linked_value}}
          {% endif %}
          ;;
    drill_fields: [MICA_Drill_Report*]
  }

  measure: gl_detail_sdi_amount_b {
    label: "Fotc Standardised GL Detail_Amount"
    description: "This column will show values coming from gl_balance_in_reporting_currency from the Standardized GL Detail SDI. These amounts should be aggregated or grouped by columns"
    type: sum
    hidden: yes
    sql: ${TABLE}.GL_Detail_SDI_Amount ;;
    #sql: ${gl_detail_sdi_amount} ;;
    value_format: "#,##0.00,,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: gl_detail_sdi_amount_m {
    label: "Fotc Standardised GL Detail_Amount"
    description: "This column will show values coming from gl_balance_in_reporting_currency from the Standardized GL Detail SDI. These amounts should be aggregated or grouped by columns"
    hidden: yes
    type: sum
    sql: ${TABLE}.GL_Detail_SDI_Amount ;;
    value_format: "#,##0.00,,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: gl_detail_sdi_amount_k {
    label: "Fotc Standardised GL Detail_Amount"
    hidden: yes
    description: "This column will show values coming from gl_balance_in_reporting_currency from the Standardized GL Detail SDI. These amounts should be aggregated or grouped by columns"
    type: sum
    sql: ${TABLE}.GL_Detail_SDI_Amount ;;
    value_format: "#,##0.00,\" \""
    drill_fields: [MICA_Drill_Report*]
  }

  measure: gl_detail_sdi_amount_all {
    label: "Fotc Standardised GL Detail_Amount"
    hidden: yes
    description: "This column will show values coming from gl_balance_in_reporting_currency from the Standardized GL Detail SDI. These amounts should be aggregated or grouped by columns"
    type: sum
    sql: ${TABLE}.GL_Detail_SDI_Amount ;;
    value_format: "#,##0.00"
    drill_fields: [MICA_Drill_Report*]
  }


}
