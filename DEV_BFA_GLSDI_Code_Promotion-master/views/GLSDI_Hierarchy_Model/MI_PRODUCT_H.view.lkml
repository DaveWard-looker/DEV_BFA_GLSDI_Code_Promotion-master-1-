view: mi_product_h  {
  label: "MI Product"
  extension: required

  set: MI_PRODUCT_description_fields {
    fields: [MI_PRODUCT_leaf_description,MI_PRODUCT_description_0,MI_PRODUCT_description_1,MI_PRODUCT_description_2,
      MI_PRODUCT_description_3,MI_PRODUCT_description_4,MI_PRODUCT_description_5,MI_PRODUCT_description_6,MI_PRODUCT_description_7,
      MI_PRODUCT_description_8,MI_PRODUCT_description_9]}

  set: MI_PRODUCT_level_fields {
    fields: [MI_PRODUCT_leaf,MI_PRODUCT_level_0,MI_PRODUCT_level_1,MI_PRODUCT_level_2,
      MI_PRODUCT_level_3,MI_PRODUCT_level_4,MI_PRODUCT_level_5,MI_PRODUCT_level_6,MI_PRODUCT_level_7,
      MI_PRODUCT_level_8,MI_PRODUCT_level_9]
  }

  dimension: MI_PRODUCT_description_0 {
    label: "Description 0"
    view_label: "MI PRODUCT"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_0} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_0 {
    label: "Level 0"
    view_label: "MI PRODUCT"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_0 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }


  dimension: MI_PRODUCT_description_1 {
    label: "Description 1"
    view_label: "MI PRODUCT"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_1} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_1 {
    label: "Level 1"
    view_label: "MI PRODUCT"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_1 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }


  dimension: MI_PRODUCT_description_2 {
    label: "Description 2"
    view_label: "MI PRODUCT"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_2} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_2 {
    label: "Level 2"
    view_label: "MI PRODUCT"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_2 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }

  dimension: MI_PRODUCT_description_3 {
    label: "Description 3"
    view_label: "MI PRODUCT"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_3} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_3 {
    label: "Level 3"
    view_label: "MI PRODUCT"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_3 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }

  dimension: MI_PRODUCT_description_4 {
    label: "Description 4"
    view_label: "MI PRODUCT"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_4} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_4 {
    label: "Level 4"
    view_label: "MI PRODUCT"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_4 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }
  dimension: MI_PRODUCT_description_5 {
    label: "Description 5"
    view_label: "MI PRODUCT"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_5} end;;
  }

  dimension: MI_PRODUCT_level_5 {
    label: "Level 5"
    view_label: "MI PRODUCT"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_5 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }
  dimension: MI_PRODUCT_description_6 {
    label: "Description 6"
    view_label: "MI PRODUCT"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_6} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_6 {
    label: "Level 6"
    view_label: "MI PRODUCT"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_6 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }
  dimension: MI_PRODUCT_description_7 {
    label: "Description 7"
    view_label: "MI PRODUCT"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_7} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_7 {
    label: "Level 7"
    view_label: "MI PRODUCT"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_7 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }
  dimension: MI_PRODUCT_description_8 {
    label: "Description 8"
    view_label: "MI PRODUCT"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_8} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_8 {
    label: "Level 8"
    view_label: "MI PRODUCT"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_8 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }

  dimension: MI_PRODUCT_description_9 {
    label: "Description 9"
    view_label: "MI PRODUCT"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${description_9} end;;
    drill_fields: [MI_PRODUCT_description_fields*]
  }

  dimension: MI_PRODUCT_level_9 {
    label: "Level 9"
    view_label: "MI PRODUCT"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.level_9 end ;;
    drill_fields: [MI_PRODUCT_level_fields*]
  }




  dimension: MI_PRODUCT_leaf {
    label: "Leaf"
    view_label: "MI PRODUCT"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="MI_PRODUCT" then ${TABLE}.code end ;;
    drill_fields: [MI_PRODUCT_level_fields*]

  }

  dimension: MI_PRODUCT_leaf_description {
    label: "Leaf Description"
    view_label: "MI PRODUCT"
    group_label: "Leaf"
    description: "Lowest Level of CostCentre Hierarchy"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="MI_PRODUCT" then  ${TABLE}.leaf_description end ;;
    drill_fields: [MI_PRODUCT_level_fields*]

  }
}
