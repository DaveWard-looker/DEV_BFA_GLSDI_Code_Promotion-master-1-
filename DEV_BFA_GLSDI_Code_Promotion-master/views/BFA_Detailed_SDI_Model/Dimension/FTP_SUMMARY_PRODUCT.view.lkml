# The name of this view in Looker is FTP_SUMMARY_PRODUCT


view: FTP_SUMMARY_PRODUCT {
  label: "FTP Summary Product"
  derived_table: {
    sql: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='FTP_SUMMARY_PRODUCT' ;;
    #datagroup_trigger: BFA_FTP_SUMMARY_PRODUCT
    }

  set: drill_description_fields {
    fields: [leaf,description_0,description_1,description_2,description_3,description_4,description_5,description_6,description_7,description_8,description_9]
  }

  set: drill_level_fields {
    fields: [leaf,level_0,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,level_9]
  }

  dimension: description_0 {
    type: string
    description: "Top Level of Hierarchy Description"
    group_label: "Level 0"
    sql: ${TABLE}.description_0 ;;
    drill_fields: [drill_description_fields*]
    }

  dimension: description_1 {
    description: "Level 1 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.description_1 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_2 {
    description: "Level 2 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.description_2 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_3 {
    description: "Level 3 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.description_3 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_4 {
    description: "Level 4 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.description_4 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_5 {
    description: "Level 5 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.description_5 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_6 {
    description: "Level 6 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.description_6 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_7 {
    description: "Level 7 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.description_7 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_8 {
    description: "Level 8 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.description_8 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_9 {
    description: "Level 9 of FTP Summary Product Hierarchy Description"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.description_9 ;;
    drill_fields: [drill_description_fields*]
  }



  dimension: dimension {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension ;;
  }


  dimension: level_0 {
    description: "Top Level of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_1 {
    description: "Level 1 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_2 {
    description: "Level 2 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.level_2 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_3 {
    description: "Level 3 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.level_3 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_4 {
    description: "Level 4 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.level_4 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_5 {
    description: "Level 5 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.level_5 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_6 {
    description: "Level 6 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.level_6 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_7 {
    description: "Level 7 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.level_7 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_8 {
    description: "Level 8 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.level_8 ;;
    drill_fields: [drill_level_fields*]

  }

  dimension: level_9 {
    description: "Level 9 of FTP Summary Product Hierarchy"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.level_9 ;;
    drill_fields: [drill_level_fields*]
  }



  dimension: leaf {
    description: "Lowest Level of FTP Summary Product Hierarchy"
    type: string
    primary_key: yes
    sql: ${TABLE}.code ;;
    drill_fields: [drill_level_fields*]
  }



  dimension: FTP_SUMMARY_PRODUCT_description_search{
    label: "FTP Summary Product Description Search"
    group_label: "Hierarchy Search"
    type: string
    primary_key: no
    sql: ${TABLE}.leaf_description ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: Level{
    label: "Level"
    group_label: "Hierarchy Search"
    type: string
    primary_key: no
    sql: concat("Level","-",${TABLE}.depth) ;;
    drill_fields: [drill_description_fields*]
  }
  dimension: depth {
    type: string
    sql: ${TABLE}.depth ;;
  }

}
