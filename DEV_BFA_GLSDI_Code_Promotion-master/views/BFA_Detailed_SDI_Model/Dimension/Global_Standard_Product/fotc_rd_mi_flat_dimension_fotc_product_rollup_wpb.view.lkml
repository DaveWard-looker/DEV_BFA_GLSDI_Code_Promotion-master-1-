##
view: fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb {
  required_access_grants: [explorer_security_wpb_1]
  label: "Global Standard Product"
  derived_table: {
    sql:  select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER
    where dimension_tree_id = {% parameter dimension_tree_id_parameter_wpb %} and dimension ='Global_Standard_Product'  ;;

  }

  set: drill_description_fields {
    fields: [leaf,description_0,description_1,description_2,description_3,description_4,description_5,description_6]
  }

  set: drill_level_fields {
    fields: [leaf,level_0,level_1,level_2,level_3,level_4,level_5,level_6]
  }


  dimension: depth {
    type: number
    hidden: no
    sql: ${TABLE}.depth ;;
  }



  dimension: dimension_tree_id_db {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: ${TABLE}.dimension_tree_id ;;

  }

  dimension: description_0 {
    description: "Top Level of Product Hierarchy"
    type: string
    group_label: "Level 0"
    group_item_label: "Description"
    sql: ${TABLE}.description_0 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_1 {
    description: "Level 1 of Product Hierarchy Description"
    type: string
    group_label: "Level 1"
    group_item_label: "Description"
    sql: ${TABLE}.description_1 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_2 {
    description: "Level 2 of Product Hierarchy Description"
    type: string
    group_label: "Level 2"
    group_item_label: "Description"
    sql: ${TABLE}.description_2 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_3 {
    description: "Level 3 of Product Hierarchy Description"
    type: string
    group_label: "Level 3"
    group_item_label: "Description"
    sql: ${TABLE}.description_3 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_4 {
    description: "Level 4 of Product Hierarchy Description"
    type: string
    group_label: "Level 4"
    group_item_label: "Description"
    sql: ${TABLE}.description_4 ;;
    drill_fields: [drill_description_fields*]
  }

  dimension: description_5 {
    description: "Level 5 of Product Hierarchy Description"
    type: string
    group_label: "Level 5"
    group_item_label: "Description"
    sql: ${TABLE}.description_5 ;;
    drill_fields: [drill_description_fields*]
  }



  dimension: description_6 {
    description: "Level 6 of Product Hierarchy Description"
    type: string
    group_label: "Level 6"
    group_item_label: "Description"
    sql: ${TABLE}.description_6 ;;
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
    drill_fields: [drill_level_fields*]
  }

  dimension: level_0 {
    description: "Top Level of Product Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    drill_fields: [drill_level_fields*]
  }

  dimension: level_1 {
    description: "Level 1 of Product Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
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

  dimension: level_5 {
    description: "Level 5 of Product Hierarchy"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.level_5 ;;
    drill_fields: [drill_level_fields*]
  }
  dimension: level_6 {
    description: "Level 6 of Product Hierarchy"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.level_6 ;;
    drill_fields: [drill_level_fields*]
  }
  dimension: weight {
    description: "Weight"
    type: number
    sql: ${TABLE}.weight ;;
  }

  dimension: dimension_tree_id_base {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('WPB1', 'WPB2', 'WPB3', 'CMB1', 'GBM1','1') then  ${dimension_tree_id_db} end;;

  }

  dimension: dimension_tree_id_WPB1 {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('WPB1') then  ${dimension_tree_id_db} end;;

  }

  dimension: dimension_tree_id_WPB2 {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('WPB2') then  ${dimension_tree_id_db} end;;

  }


  dimension: dimension_tree_id_WPB3 {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('WPB3') then  ${dimension_tree_id_db} end;;

  }

  dimension: dimension_tree_id_GBM1 {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('GBM1') then  ${dimension_tree_id_db} end;;

  }

  dimension: dimension_tree_id_All {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('1') then  ${dimension_tree_id_db} end;;

  }


  dimension: dimension_tree_id_cmb {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ( 'CMB1') then  ${dimension_tree_id_db} end;;

  }


  dimension: dimension_tree_id_wpb {
    description: "Dimension Tree Id"
    hidden: yes
    type: string
    sql: case when ${dimension_tree_id_db} in ('WPB1', 'WPB2', 'WPB3') then  ${dimension_tree_id_db} end;;

  }


  parameter: product_parameter {
    description: "Dynamic Filter for Product Parameter for the filtering data at different Level of Hierarchy"
    type: string
    # view_label: "Product"
    # group_label: "Dynamic Hierarchy"
    allowed_value: {
      label: "Product-Level 0"
      value: "Level 0"
    }
    allowed_value: {
      label: "Product-Level 1"
      value: "Level 1"
    }
    allowed_value: {
      label: "Product-Level 2"
      value: "Level 2"
    }
    allowed_value: {
      label: "Product-Level 3"
      value: "Level 3"
    }
    allowed_value: {
      label: "Product-Level 4"
      value: "Level 4"
    }
    allowed_value: {
      label: "Product-Level 5"
      value: "Level 5"
    }
    allowed_value: {
      label: "Product-Level 6"
      value: "Level 6"
    }
    allowed_value: {
      label: "Product Leaf "
      value: "Leaf"
    }

  }
  #

  dimension: dynamic_product_hierarchy {
    description: "Dynamic Product Level of Hierarchical Dimension of Product Filter Selection "
    type: string
    label_from_parameter: product_parameter
    # view_label: "Product"
    sql: case
          WHEN {% parameter product_parameter %} = 'Level 0' THEN ${description_0}
          WHEN {% parameter product_parameter %} = 'Level 1' THEN  ${description_1}
          WHEN {% parameter product_parameter %} = 'Level 2' THEN ${description_2}
          WHEN {% parameter product_parameter %} = 'Level 3' THEN ${description_3}
          WHEN {% parameter product_parameter %} = 'Level 4' THEN ${description_4}
          WHEN {% parameter product_parameter %} = 'Level 5' THEN ${description_5}
          WHEN {% parameter product_parameter %} = 'Level 6' THEN ${description_6}
          else ${leaf}

      END ;;
    drill_fields: [drill_description_fields*]
  }


  parameter: dimension_tree_id_parameter_wpb {
    required_access_grants: [explorer_security_wpb_1]
    label: "Dimension Tree Id"
    #description: "Dynamic Filter for Product Parameter for the filtering data at different Level of Hierarchy"
    type: string
    hidden: no
    # view_label: "Product"
    # group_label: "Dynamic Hierarchy"
    allowed_value: {
      label: "Total WPB"
      value: "WPB1"
    }
    allowed_value: {
      label: "WPB Retail"
      value: "WPB2"
    }
    allowed_value: {
      label: "WPB Wealth"
      value: "WPB3"
    }
    allowed_value: {
      label: "Fotc Product"
      value: "1"
    }

  }



  dimension: dimension_tree_id_wpb_1 {
    label: "Dimension Tree Id"
    required_access_grants: [explorer_security_wpb_1]
    description: "Dynamic Product Level of Hierarchical Dimension of Product Filter Selection "
    type: string
    label_from_parameter: product_parameter
    # view_label: "Product"
    sql: case
          WHEN {% parameter dimension_tree_id_parameter_wpb %} = 'WPB1' THEN ${dimension_tree_id_WPB1}
          WHEN {% parameter dimension_tree_id_parameter_wpb %} = 'WPB2' THEN  ${dimension_tree_id_WPB2}
          WHEN {% parameter dimension_tree_id_parameter_wpb %} = 'WPB3' THEN  ${dimension_tree_id_WPB3}
         else ${dimension_tree_id_All}
        END ;;
    drill_fields: [drill_description_fields*]
      }


  dimension: Global_Standard_Product_description_search{
    label: "Global Standard Product Description Search"
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
    sql: ${TABLE}.depth ;;
    drill_fields: [drill_description_fields*]
  }
}
