view: ftp_summary_customer_type_h {
label: "FTP SUMMARY CUSTOMER TYPE"
  extension: required

  set: FTP_SUMMARY_CUSTOMER_TYPE_description_fields {
    fields: [FTP_SUMMARY_CUSTOMER_TYPE_leaf_description,FTP_SUMMARY_CUSTOMER_TYPE_description_0,FTP_SUMMARY_CUSTOMER_TYPE_description_1,FTP_SUMMARY_CUSTOMER_TYPE_description_2,FTP_SUMMARY_CUSTOMER_TYPE_description_3,FTP_SUMMARY_CUSTOMER_TYPE_description_4,FTP_SUMMARY_CUSTOMER_TYPE_description_5,
            FTP_SUMMARY_CUSTOMER_TYPE_description_6,FTP_SUMMARY_CUSTOMER_TYPE_description_7]}

  set: FTP_SUMMARY_CUSTOMER_TYPE_level_fields {
    fields: [FTP_SUMMARY_CUSTOMER_TYPE_leaf,FTP_SUMMARY_CUSTOMER_TYPE_level_0,FTP_SUMMARY_CUSTOMER_TYPE_level_1,FTP_SUMMARY_CUSTOMER_TYPE_level_2,FTP_SUMMARY_CUSTOMER_TYPE_level_3,
             FTP_SUMMARY_CUSTOMER_TYPE_level_4,FTP_SUMMARY_CUSTOMER_TYPE_level_5,
            FTP_SUMMARY_CUSTOMER_TYPE_level_6,FTP_SUMMARY_CUSTOMER_TYPE_level_7] }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_0 {
    label: "Description 0"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_0} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_0 {
    label: "Level 0"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_0 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }


  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_1 {
    label: "Description 1"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_1} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_1 {
    label: "Level 1"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_1 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }


  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_2 {
    label: "Description 2"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_2} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_2 {
    label: "Level 2"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_2 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_3 {
    label: "Description 3"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_3} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_3 {
    label: "Level 3"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_3 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_4 {
    label: "Description 4"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_4} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_4 {
    label: "Level 4"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_4 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }
  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_5 {
    label: "Description 5"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_5} end;;
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_5 {
    label: "Level 5"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_5 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }
  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_6 {
    label: "Description 6"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_6} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_6 {
    label: "Level 6"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_6 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }
  dimension: FTP_SUMMARY_CUSTOMER_TYPE_description_7 {
    label: "Description 7"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${description_7} end;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_description_fields*]
  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_level_7 {
    label: "Level 7"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.level_7 end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]
  }


  dimension: FTP_SUMMARY_CUSTOMER_TYPE_leaf {
    label: "Leaf"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then ${TABLE}.code end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]

  }

  dimension: FTP_SUMMARY_CUSTOMER_TYPE_leaf_description {
    label: "Leaf Description"
    view_label: "FTP SUMMARY CUSTOMER TYPE"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="FTP_SUMMARY_CUSTOMER_TYPE" then  ${TABLE}.leaf_description end ;;
    drill_fields: [FTP_SUMMARY_CUSTOMER_TYPE_level_fields*]

  }
}
