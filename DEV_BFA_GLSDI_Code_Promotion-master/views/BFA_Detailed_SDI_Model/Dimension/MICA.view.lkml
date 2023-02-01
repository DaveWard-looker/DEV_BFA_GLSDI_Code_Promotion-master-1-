# The name of this view in Looker is MI MICA"

view: MICA{
 label: "MICA"
  derived_table: {
    sql:select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_MICA' ;;
    #datagroup_trigger: BFA_average_b_s_mica
    }
  set: drill_description_fields {
    fields: [leaf,description_0,description_1,description_2,description_3,description_4,description_5,description_6,description_7,description_8,description_9,description_10,description_11,description_12,description_13,description_14,description_15]
  }

  set: drill_level_fields {
    fields: [leaf,level_0,level_1,level_2,level_3,level_4,level_5,level_6,level_7,level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15]
  }



  dimension: description_0 {
    type: string
    description: "Top Level of Hierarchy Description"
    group_label: "Level 0"
    sql: ${TABLE}.description_0 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_1 {
    description: "Level 1 of MICA Hierarchy Description"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.description_1 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_2 {
    description: "Level 2 of MICA Hierarchy Description"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.description_2 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_3 {
    description: "Level 3 of MICA Hierarchy Description"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.description_3 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_4 {
    description: "Level 4 of MICA Hierarchy Description"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.description_4 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_5 {
    description: "Level 5 of MICA Hierarchy Description"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.description_5 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_6 {
    description: "Level 6 of MICA Hierarchy Description"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.description_6 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_7 {
    description: "Level 7 of MICA Hierarchy Description"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.description_7 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_8 {
    description: "Level 8 of MICA Hierarchy Description"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.description_8 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_9 {
    description: "Level 9 of MICA Hierarchy Description"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.description_9 ;;
    drill_fields: [drill_description_fields*]
  }


  dimension: description_10 {
    description: "Level 10 of MICA Hierarchy Description"
    type: string
    group_label: "Level-10"
    sql: ${TABLE}.description_10 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_11 {
    description: "Level 11 of MICA Hierarchy Description"
    type: string
    group_label: "Level-11"
    sql: ${TABLE}.description_11 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_12 {
    description: "Level 12 of MICA Hierarchy Description"
    type: string
    group_label: "Level-12"
    sql: ${TABLE}.description_12 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_13 {
    description: "Level 13 of MICA Hierarchy Description"
    type: string
    group_label: "Level-13"
    sql: ${TABLE}.description_13 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_14 {
    description: "Level 14 of MICA Hierarchy Description"
    type: string
    group_label: "Level-14"
    sql: ${TABLE}.description_14 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_15 {
    description: "Level 15 of MICA Hierarchy Description"
    type: string
    group_label: "Level-15"
    sql: ${TABLE}.description_15 ;;
    drill_fields: [drill_description_fields*]
  }

  # dimension: description_16 {
  #   description: "Level 16 of MICA Hierarchy Description"
  #   type: string
  #   group_label: "Level-16"
  #   sql: ${TABLE}.description_16 ;;
  #   drill_fields: [drill_description_fields*]
  # }

  # dimension: description_17 {
  #   description: "Level 17 of MICA Hierarchy Description"
  #   type: string
  #   group_label: "Level-17"
  #   sql: ${TABLE}.description_17 ;;
  #   drill_fields: [drill_description_fields*]
  # }



  dimension: dimension {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension ;;
  }


  dimension: level_0 {
    description: "Top Level of MICA Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_1 {
    description: "Level 1 of MICA Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_2 {
    description: "Level 2 of MICA Hierarchy"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.level_2 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_3 {
    description: "Level 3 of MICA Hierarchy"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.level_3 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_4 {
    description: "Level 4 of MICA Hierarchy"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.level_4 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_5 {
    description: "Level 5 of MICA Hierarchy"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.level_5 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_6 {
    description: "Level 6 of MICA Hierarchy"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.level_6 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_7 {
    description: "Level 7 of MICA Hierarchy"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.level_7 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_8 {
    description: "Level 8 of MICA Hierarchy"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.level_8 ;;
    drill_fields: [drill_level_fields*]

  }

  dimension: level_9 {
    description: "Level 9 of MICA Hierarchy"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.level_9 ;;
    drill_fields: [drill_level_fields*]
  }


  dimension: level_10 {
    description: "Level 10 of MICA Hierarchy"
    type: string
    group_label: "Level-10"
    sql: ${TABLE}.level_10 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_11 {
    description: "Level 11 of MICA Hierarchy"
    type: string
    group_label: "Level-11"
    sql: ${TABLE}.level_11 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_12 {
    description: "Level 12 of MICA Hierarchy"
    type: string
    group_label: "Level-12"
    sql: ${TABLE}.level_12 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_13 {
    description: "Level 13 of MICA Hierarchy"
    type: string
    group_label: "Level-13"
    sql: ${TABLE}.level_13 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_14 {
    description: "Level 14 of MICA Hierarchy"
    type: string
    group_label: "Level-14"
    sql: ${TABLE}.level_14 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_15 {
    description: "Level 15 of MICA Hierarchy"
    type: string
    group_label: "Level-15"
    sql: ${TABLE}.level_15 ;;
    drill_fields: [drill_level_fields*]
  }


  dimension: leaf {
    description: "Lowest Level of MICA Hierarchy"
    type: string
    primary_key: yes
    sql: ${TABLE}.code ;;
    drill_fields: [drill_level_fields*]
  }



  dimension: MICA_search{
    label: "MICA Search"
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
