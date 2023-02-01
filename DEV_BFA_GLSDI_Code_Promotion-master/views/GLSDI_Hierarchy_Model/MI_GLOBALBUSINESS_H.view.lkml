view: mi_globalbusiness_h{
  label: "MI GLOBALBUSINESS"
  extension: required

  set:  MI_GLOBALBUSINESS_description_fields {
    fields: [ MI_GLOBALBUSINESS_leaf_description, MI_GLOBALBUSINESS_description_0, MI_GLOBALBUSINESS_description_1, MI_GLOBALBUSINESS_description_2, MI_GLOBALBUSINESS_description_3, MI_GLOBALBUSINESS_description_4, MI_GLOBALBUSINESS_description_5]}

  set:  MI_GLOBALBUSINESS_level_fields {
    fields: [ MI_GLOBALBUSINESS_leaf, MI_GLOBALBUSINESS_level_0, MI_GLOBALBUSINESS_level_1, MI_GLOBALBUSINESS_level_2, MI_GLOBALBUSINESS_level_3, MI_GLOBALBUSINESS_level_4, MI_GLOBALBUSINESS_level_5]
  }

  dimension:  MI_GLOBALBUSINESS_description_0 {
    label: "Description 0"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_0} end;;
    drill_fields: [ MI_GLOBALBUSINESS_description_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_level_0 {
    label: "Level 0"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_0 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }


  dimension:  MI_GLOBALBUSINESS_description_1 {
    label: "Description 1"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_1} end;;
    drill_fields: [ MI_GLOBALBUSINESS_description_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_level_1 {
    label: "Level 1"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_1 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }


  dimension:  MI_GLOBALBUSINESS_description_2 {
    label: "Description 2"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_2} end;;
    drill_fields: [ MI_GLOBALBUSINESS_description_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_level_2 {
    label: "Level 2"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_2 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_description_3 {
    label: "Description 3"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_3} end;;
    drill_fields: [ MI_GLOBALBUSINESS_description_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_level_3 {
    label: "Level 3"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_3 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_description_4 {
    label: "Description 4"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_4} end;;
    drill_fields: [ MI_GLOBALBUSINESS_description_fields*]
  }

  dimension:  MI_GLOBALBUSINESS_level_4 {
    label: "Level 4"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_4 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }
  dimension:  MI_GLOBALBUSINESS_description_5 {
    label: "Description 5"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${description_5} end;;
  }

  dimension:  MI_GLOBALBUSINESS_level_5 {
    label: "Level 5"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.level_5 end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]
  }



  dimension:  MI_GLOBALBUSINESS_leaf {
    label: "Leaf"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then ${TABLE}.code end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]

  }

  dimension:  MI_GLOBALBUSINESS_leaf_description {
    label: "Leaf Description"
    view_label: "MI GLOBALBUSINESS"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="MI_GLOBALBUSINESS" then  ${TABLE}.leaf_description end ;;
    drill_fields: [ MI_GLOBALBUSINESS_level_fields*]

  }
}
