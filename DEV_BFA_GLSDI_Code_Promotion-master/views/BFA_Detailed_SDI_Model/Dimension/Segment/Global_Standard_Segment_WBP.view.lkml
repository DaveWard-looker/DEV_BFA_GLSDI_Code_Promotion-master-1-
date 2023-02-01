view: global_standard_segment_wbp {
label: "Segment"
  derived_table: {
    sql: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='Global_Standard_Segment' and dimension_tree_id ='1'  and level_1='GSS10001' ;;
   # datagroup_trigger: BFA_Global_Standard_Segment
    }

  set: drill_description_fields {
    fields: [leaf,description_0,description_1,description_2,description_3,description_4]
    }

  set: drill_level_fields {
    fields: [leaf,level_0,level_1,level_2,level_3,level_4]
  }

  dimension: description_0 {
    type: string
    description: "Top Level of Hierarchy Description"
    group_label: "Level 0"
    sql: ${TABLE}.description_0 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_1 {
    description: "Level 1 of Global Standard Segment  Hierarchy Description"
    hidden: no
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.description_1 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_2 {
    description: "Level 2 of Global Standard Segment  Hierarchy Description"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.description_2 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_3 {
    description: "Level 3 of Global Standard Segment  Hierarchy Description"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.description_3 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_4 {
    description: "Level 4 of Global Standard Segment  Hierarchy Description"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.description_4 ;;
    drill_fields: [drill_description_fields*]
  }


  dimension: dimension {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension ;;
  }


  dimension: level_0 {
    description: "Top Level of Global Standard Segment  Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_1 {
    description: "Level 1 of Global Standard Segment  Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_2 {
    description: "Level 2 of Global Standard Segment  Hierarchy"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.level_2 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_3 {
    description: "Level 3 of Global Standard Segment  Hierarchy"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.level_3 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_4 {
    description: "Level 4 of Global Standard Segment  Hierarchy"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.level_4 ;;
    drill_fields: [drill_level_fields*]
  }


  dimension: leaf {
    description: "Lowest Level of Global Standard Segment  Hierarchy"
    type: string
    primary_key: yes
    sql: ${TABLE}.code ;;
    drill_fields: [drill_level_fields*]
  }



  dimension: segment_description_search{
    label: "Segment Description Search"
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
