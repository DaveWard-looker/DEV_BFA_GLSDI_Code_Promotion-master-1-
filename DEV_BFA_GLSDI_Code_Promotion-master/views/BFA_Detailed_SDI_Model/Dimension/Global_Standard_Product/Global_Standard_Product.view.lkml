# The name of this view in Looker is Global_Standard_Product
view: Global_Standard_Product  {
  label: "Standard Product"
  derived_table: {
  sql: select * from @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension_tree_id = '1' and dimension ='Global_Standard_Product';;

  }

  set: drill_description_fields {
    fields: [leaf,description_0,description_1,description_2,description_3,description_4]
    }


  set: drill_level_fields {
    fields: [leaf,level_0,level_1,level_2,level_3,level_4]
  }


  dimension: description_0 {
    description: "Top Level of Product Hierarchy"
    type: string
    group_label: "Level 0"
    group_item_label: "Description"
    sql: ${TABLE}.description_0 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_description_fields*]
  }

  dimension: description_1 {
    description: "Level 1 of Product Hierarchy Description"
    type: string
    group_label: "Level 1"
    group_item_label: "Description"
    sql: ${TABLE}.description_1 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_description_fields*]
  }

  dimension: description_2 {
    description: "Level 2 of Product Hierarchy Description"
    type: string
    group_label: "Level 2"
    group_item_label: "Description"
    sql: ${TABLE}.description_2 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_description_fields*]
  }

  dimension: description_3 {
    description: "Level 3 of Product Hierarchy Description"
    type: string
    group_label: "Level 3"
    group_item_label: "Description"
    sql: ${TABLE}.description_3 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_description_fields*]
  }

  dimension: description_4 {
    description: "Level 4 of Product Hierarchy Description"
    type: string
    group_label: "Level 4"
    group_item_label: "Description"
    sql: ${TABLE}.description_4 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_description_fields*]
  }






  dimension: dimension {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension ;;
  }

  dimension: leaf {
    description: "Lowest Level of Product Hierarchy"
    type: string
    # group_label: "Level"
    primary_key: yes
    sql: ${TABLE}.code ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [level_1,level_2,level_3,level_4,leaf]
  }

  dimension: level_0 {
    description: "Top Level of Product Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [level_1,level_2,level_3,level_4,leaf]
  }

  dimension: level_1 {
    description: "Level 1 of Product Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
    alpha_sort: yes  ### Sort Data Alphabetically
    drill_fields: [drill_level_fields*]
  }

  dimension: level_2 {
    description: "Level 2 of Product Hierarchy"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.level_2 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_3 {
    description: "Level 3 of Product Hierarchy"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.level_3 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_4 {
    description: "Level 4 of Product Hierarchy"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.level_4 ;;
    drill_fields: [drill_level_fields*]
  }
  dimension: depth {
    type: string
    sql: ${TABLE}.depth ;;
  }


}
