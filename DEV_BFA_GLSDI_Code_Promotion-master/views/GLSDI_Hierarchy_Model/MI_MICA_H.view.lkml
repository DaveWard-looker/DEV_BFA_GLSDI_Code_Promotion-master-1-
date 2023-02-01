view: mi_mica_h {
  label: "MI MICA"
  extension: required

  set: MI_MICA_description_fields {
    fields: [MI_MICA_leaf_description,MI_MICA_description_0,MI_MICA_description_1,
      MI_MICA_description_2,MI_MICA_description_3,MI_MICA_description_4,
      MI_MICA_description_5,MI_MICA_description_6,MI_MICA_description_7,
      MI_MICA_description_8,MI_MICA_description_9,MI_MICA_description_10,MI_MICA_description_11
      ,MI_MICA_description_12,MI_MICA_description_13,MI_MICA_description_14,MI_MICA_description_15,MI_MICA_description_16,MI_MICA_description_17
    ]}

  set: MI_MICA_level_fields {
    fields: [MI_MICA_leaf,MI_MICA_level_0,MI_MICA_level_1,
      MI_MICA_level_2,MI_MICA_level_3,MI_MICA_level_4,MI_MICA_level_5,
      MI_MICA_level_6,MI_MICA_level_7,MI_MICA_level_8,MI_MICA_level_9,MI_MICA_level_10,
      MI_MICA_level_11,MI_MICA_level_12,MI_MICA_level_13,MI_MICA_level_14,MI_MICA_level_15,MI_MICA_level_16,MI_MICA_level_17]
  }

  dimension: MI_MICA_description_0 {
    label: "Description 0"
    view_label: "MI MICA"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_0} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_0 {
    label: "Level 0"
    view_label: "MI MICA"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_0 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }


  dimension: MI_MICA_description_1 {
    label: "Description 1"
    view_label: "MI MICA"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_1} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_1 {
    label: "Level 1"
    view_label: "MI MICA"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_1 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }


  dimension: MI_MICA_description_2 {
    label: "Description 2"
    view_label: "MI MICA"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_2} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_2 {
    label: "Level 2"
    view_label: "MI MICA"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_2 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }

  dimension: MI_MICA_description_3 {
    label: "Description 3"
    view_label: "MI MICA"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_3} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_3 {
    label: "Level 3"
    view_label: "MI MICA"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_3 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }

  dimension: MI_MICA_description_4 {
    label: "Description 4"
    view_label: "MI MICA"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_4} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_4 {
    label: "Level 4"
    view_label: "MI MICA"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_4 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_5 {
    label: "Description 5"
    view_label: "MI MICA"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_5} end;;
  }

  dimension: MI_MICA_level_5 {
    label: "Level 5"
    view_label: "MI MICA"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_5 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_6 {
    label: "Description 6"
    view_label: "MI MICA"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_6} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_6 {
    label: "Level 6"
    view_label: "MI MICA"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_6 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_7 {
    label: "Description 7"
    view_label: "MI MICA"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_7} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_7 {
    label: "Level 7"
    view_label: "MI MICA"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_7 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_8 {
    label: "Description 8"
    view_label: "MI MICA"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_8} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_8 {
    label: "Level 8"
    view_label: "MI MICA"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_8 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }

  dimension: MI_MICA_description_9 {
    label: "Description 9"
    view_label: "MI MICA"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_9} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_9 {
    label: "Level 9"
    view_label: "MI MICA"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_9 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }


  dimension: MI_MICA_description_10 {
    label: "Description 10"
    view_label: "MI MICA"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_10} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_10 {
    label: "Level 10"
    view_label: "MI MICA"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_10 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }


  dimension: MI_MICA_description_11 {
    label: "Description 11"
    view_label: "MI MICA"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_11} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_11 {
    label: "Level 11"
    view_label: "MI MICA"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_11 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_12 {
    label: "Description 12"
    view_label: "MI MICA"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_12} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_12 {
    label: "Level 12"
    view_label: "MI MICA"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_12 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_13 {
    label: "Description 13"
    view_label: "MI MICA"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_13} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_13 {
    label: "Level 13"
    view_label: "MI MICA"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_13 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_14 {
    label: "Description 14"
    view_label: "MI MICA"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_14} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_14 {
    label: "Level 14"
    view_label: "MI MICA"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_14 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }
  dimension: MI_MICA_description_15 {
    label: "Description 15"
    view_label: "MI MICA"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_15} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_15 {
    label: "Level 15"
    view_label: "MI MICA"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_15 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }


  dimension: MI_MICA_description_16 {
    label: "Description 16"
    view_label: "MI MICA"
    group_label: "Level-16"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_16} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_16 {
    label: "Level 16"
    view_label: "MI MICA"
    group_label: "Level-16"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_16 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }

  dimension: MI_MICA_description_17 {
    label: "Description 17"
    view_label: "MI MICA"
    group_label: "Level-17"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${description_17} end;;
    drill_fields: [MI_MICA_description_fields*]
  }

  dimension: MI_MICA_level_17 {
    label: "Level 17"
    view_label: "MI MICA"
    group_label: "Level-17"
    type: string
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.level_17 end ;;
    drill_fields: [MI_MICA_level_fields*]
  }

  dimension: MI_MICA_leaf {
    label: "Leaf"
    view_label: "MI MICA"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="MI_MICA" then ${TABLE}.code end ;;
    drill_fields: [MI_MICA_level_fields*]

  }

  dimension: MI_MICA_leaf_description {
    label: "Leaf Description"
    view_label: "MI MICA"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="MI_MICA" then  ${TABLE}.leaf_description end ;;
    drill_fields: [MI_MICA_level_fields*]

  }
}
