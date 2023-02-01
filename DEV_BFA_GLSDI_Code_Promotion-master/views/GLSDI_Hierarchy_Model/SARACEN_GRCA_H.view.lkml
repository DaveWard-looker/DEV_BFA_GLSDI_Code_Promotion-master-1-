view: saracen_grca_h {
  label: "SARACEN GRCA"
  extension: required

  set: SARACEN_GRCA_description_fields {
    fields: [SARACEN_GRCA_leaf_description,SARACEN_GRCA_description_0,SARACEN_GRCA_description_1,
      SARACEN_GRCA_description_2,SARACEN_GRCA_description_3,SARACEN_GRCA_description_4,
      SARACEN_GRCA_description_5,SARACEN_GRCA_description_6,SARACEN_GRCA_description_7,
      SARACEN_GRCA_description_8,SARACEN_GRCA_description_9,SARACEN_GRCA_description_10,SARACEN_GRCA_description_11
      ,SARACEN_GRCA_description_12,SARACEN_GRCA_description_13,SARACEN_GRCA_description_14,SARACEN_GRCA_description_15
    ]}

  set: SARACEN_GRCA_level_fields {
    fields: [SARACEN_GRCA_leaf,SARACEN_GRCA_level_0,SARACEN_GRCA_level_1,
      SARACEN_GRCA_level_2,SARACEN_GRCA_level_3,SARACEN_GRCA_level_4,SARACEN_GRCA_level_5,
      SARACEN_GRCA_level_6,SARACEN_GRCA_level_7,SARACEN_GRCA_level_8,SARACEN_GRCA_level_9,SARACEN_GRCA_level_10,
      SARACEN_GRCA_level_11,SARACEN_GRCA_level_12,SARACEN_GRCA_level_13,SARACEN_GRCA_level_14,SARACEN_GRCA_level_15]
  }

  dimension: SARACEN_GRCA_description_0 {
    label: "Description 0"
    view_label: "SARACEN GRCA"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_0} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_0 {
    label: "Level 0"
    view_label: "SARACEN GRCA"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_0 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }


  dimension: SARACEN_GRCA_description_1 {
    label: "Description 1"
    view_label: "SARACEN GRCA"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_1} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_1 {
    label: "Level 1"
    view_label: "SARACEN GRCA"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_1 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }


  dimension: SARACEN_GRCA_description_2 {
    label: "Description 2"
    view_label: "SARACEN GRCA"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_2} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_2 {
    label: "Level 2"
    view_label: "SARACEN GRCA"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_2 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }

  dimension: SARACEN_GRCA_description_3 {
    label: "Description 3"
    view_label: "SARACEN GRCA"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_3} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_3 {
    label: "Level 3"
    view_label: "SARACEN GRCA"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_3 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }

  dimension: SARACEN_GRCA_description_4 {
    label: "Description 4"
    view_label: "SARACEN GRCA"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_4} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_4 {
    label: "Level 4"
    view_label: "SARACEN GRCA"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_4 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_5 {
    label: "Description 5"
    view_label: "SARACEN GRCA"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_5} end;;
  }

  dimension: SARACEN_GRCA_level_5 {
    label: "Level 5"
    view_label: "SARACEN GRCA"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_5 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_6 {
    label: "Description 6"
    view_label: "SARACEN GRCA"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_6} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_6 {
    label: "Level 6"
    view_label: "SARACEN GRCA"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_6 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_7 {
    label: "Description 7"
    view_label: "SARACEN GRCA"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_7} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_7 {
    label: "Level 7"
    view_label: "SARACEN GRCA"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_7 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_8 {
    label: "Description 8"
    view_label: "SARACEN GRCA"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_8} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_8 {
    label: "Level 8"
    view_label: "SARACEN GRCA"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_8 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }

  dimension: SARACEN_GRCA_description_9 {
    label: "Description 9"
    view_label: "SARACEN GRCA"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_9} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_9 {
    label: "Level 9"
    view_label: "SARACEN GRCA"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_9 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }


  dimension: SARACEN_GRCA_description_10 {
    label: "Description 10"
    view_label: "SARACEN GRCA"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_10} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_10 {
    label: "Level 10"
    view_label: "SARACEN GRCA"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_10 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }


  dimension: SARACEN_GRCA_description_11 {
    label: "Description 11"
    view_label: "SARACEN GRCA"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_11} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_11 {
    label: "Level 11"
    view_label: "SARACEN GRCA"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_11 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_12 {
    label: "Description 12"
    view_label: "SARACEN GRCA"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_12} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_12 {
    label: "Level 12"
    view_label: "SARACEN GRCA"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_12 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_13 {
    label: "Description 13"
    view_label: "SARACEN GRCA"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_13} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_13 {
    label: "Level 13"
    view_label: "SARACEN GRCA"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_13 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_14 {
    label: "Description 14"
    view_label: "SARACEN GRCA"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_14} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_14 {
    label: "Level 14"
    view_label: "SARACEN GRCA"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_14 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }
  dimension: SARACEN_GRCA_description_15 {
    label: "Description 15"
    view_label: "SARACEN GRCA"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${description_15} end;;
    drill_fields: [SARACEN_GRCA_description_fields*]
  }

  dimension: SARACEN_GRCA_level_15 {
    label: "Level 15"
    view_label: "SARACEN GRCA"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.level_15 end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]
  }


  dimension: SARACEN_GRCA_leaf {
    label: "Leaf"
    view_label: "SARACEN GRCA"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="SARACEN_GRCA" then ${TABLE}.code end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]

  }

  dimension: SARACEN_GRCA_leaf_description {
    label: "Leaf Description"
    view_label: "SARACEN GRCA"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="SARACEN_GRCA" then  ${TABLE}.leaf_description end ;;
    drill_fields: [SARACEN_GRCA_level_fields*]

  }
}
