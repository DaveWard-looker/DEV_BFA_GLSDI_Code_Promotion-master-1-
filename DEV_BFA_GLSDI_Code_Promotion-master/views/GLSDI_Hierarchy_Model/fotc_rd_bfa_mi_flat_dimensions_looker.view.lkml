# The name of this view in Looker is "Fotc Rd Bfa Mi Flat Dimensions Looker"


include:"/views/GLSDI_Hierarchy_Model/Function_Hierarchy.view"
include: "/views/GLSDI_Hierarchy_Model/FTP_COSTCENTRE_Hierarchy.view"
include: "/views/GLSDI_Hierarchy_Model/FTP_GOCA_ACCOUNT_H.view"
include: "/views/GLSDI_Hierarchy_Model/FTP_SUMMARY_CUSTOMER_TYPE_H.view"
include: "/views/GLSDI_Hierarchy_Model/FTP_SUMMARY_PRODUCT_H.view"
include: "/views/GLSDI_Hierarchy_Model/Global_Standard_Product_H.view"
include: "/views/GLSDI_Hierarchy_Model/Global_Standard_Segment_H.view"
include: "/views/GLSDI_Hierarchy_Model/MI_ENTITY_H.view"
include:"/views/GLSDI_Hierarchy_Model/MI_GLOBALBUSINESS_H.view.lkml"
include: "/views/GLSDI_Hierarchy_Model/MI_MICA_H.view.lkml"
include: "/views/GLSDI_Hierarchy_Model/MI_PRODUCT_H.view.lkml"
include: "/views/GLSDI_Hierarchy_Model/SARACEN_GRCA_H.view.lkml"

view: fotc_rd_bfa_mi_flat_dimensions_looker {


extends:[function_hierarchy,ftp_costcentre_hierarchy,FTP_GOCA_ACCOUNT_H,ftp_summary_customer_type_h
          ,ftp_summary_product_h,global_standard_product_h,global_standard_segment_h,mi_entity_h
          ,mi_globalbusiness_h,mi_mica_h,mi_product_h,saracen_grca_h]

label: "GLSDI Hierarchical"

  derived_table: {
    sql: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER
       where dimension in ("FTP_COSTCENTRE",
                  "FTP_GOCA_ACCOUNT",
                  "FTP_SUMMARY_CUSTOMER_TYPE",
                  "FTP_SUMMARY_PRODUCT",
                  "Global_Standard_Product",
                  "Global_Standard_Segment",
                  "MI_ENTITY",
                  "MI_FUNCTION",
                  "MI_GLOBALBUSINESS",
                  "MI_MICA",
                  "MI_PRODUCT",
                  "SARACEN_GRCA")  ;;
  }
  dimension: code {
    label: "Leaf Code"
    group_label: "Leaf"
    type: string
    sql: ${TABLE}.code ;;
    hidden: yes
  }

  dimension: depth {
    type: number
    hidden: yes
    sql: ${TABLE}.depth ;;
  }

  dimension: Level{
    label: "Level"
    hidden: yes
    type: number
    sql: concat("Level","-",${depth});;
  }


  # measure: total_depth {
  #   type: sum
  #   sql: ${depth} ;;
  # }

  # measure: average_depth {
  #   type: average
  #   sql: ${depth} ;;
  # }

  dimension: description_0 {
    group_label: "Level 0"
    type: string
    sql:  ${TABLE}.description_0 ;;
    hidden: yes
  }

  dimension: description_1 {
    group_label: "Level 1"
    type: string
    sql: ${TABLE}.description_1 ;;
    hidden: yes
  }

  dimension: description_2 {
    group_label: "Level 2"
    type: string
    sql: ${TABLE}.description_2 ;;
    hidden: yes
  }
  dimension: description_3 {
    group_label: "Level 3"
    type: string
    sql: ${TABLE}.description_3 ;;
    hidden: yes
  }

  dimension: description_4 {
    group_label: "Level 4"
    type: string
    sql: ${TABLE}.description_4 ;;
    hidden: yes
  }

  dimension: description_5 {
    group_label: "Level 5"
    type: string
    sql: ${TABLE}.description_5 ;;
    hidden: yes
  }

  dimension: description_6 {
    group_label: "Level 6"
    type: string
    sql: ${TABLE}.description_6 ;;
    hidden: yes
  }

  dimension: description_7 {
    group_label: "Level 7"
    type: string
    sql: ${TABLE}.description_7 ;;
    hidden: yes
  }

  dimension: description_8 {
    group_label: "Level 8"
    type: string
    sql: ${TABLE}.description_8 ;;
    hidden: yes
  }

  dimension: description_9 {
    group_label: "Level 9"
    type: string
    sql: ${TABLE}.description_9 ;;
    hidden: yes
  }

  dimension: description_10 {
    group_label: "Level-10"
    type: string
    sql: ${TABLE}.description_10 ;;
    hidden: yes
  }

  dimension: description_11 {
    group_label: "Level-11"
    type: string
    sql: ${TABLE}.description_11 ;;
    hidden: yes
  }

  dimension: description_12 {
    group_label: "Level-12"
    type: string
    sql: ${TABLE}.description_12 ;;
    hidden: yes
  }

  dimension: description_13 {
    group_label: "Level-13"
    type: string
    sql: ${TABLE}.description_13 ;;
    hidden: yes
  }

  dimension: description_14 {
    group_label: "Level-14"
    type: string
    sql: ${TABLE}.description_14 ;;
    hidden: yes
  }

  dimension: description_15 {
    group_label: "Level-15"
    type: string
    sql: ${TABLE}.description_15 ;;
    hidden: yes
  }

  dimension: description_16 {
    group_label: "Level-16"
    type: string
    sql: ${TABLE}.description_16 ;;
    hidden: yes
  }

  dimension: description_17 {
    group_label: "Level-17"
    type: string
    sql: ${TABLE}.description_17 ;;
    hidden: yes
  }

  dimension: description_18 {
    group_label: "Level-18"
    type: string
    sql: ${TABLE}.description_18 ;;
    hidden: yes
  }

  dimension: description_19 {
    group_label: "Level-19"
    type: string
    sql: ${TABLE}.description_19 ;;
    hidden: yes
  }

  dimension: description_20 {
    group_label: "Level-20"
    type: string
    sql: ${TABLE}.description_20 ;;
    hidden: yes
  }



  dimension: dimension {
    type: string
    sql: ${TABLE}.dimension ;;
    hidden: yes
  }

  dimension: dimension_tree_id {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension_tree_id ;;

  }

  dimension: leaf_description {
    group_label: "Leaf"
    type: string
    sql: ${TABLE}.leaf_description ;;
    hidden: yes
  }

  dimension: level_0 {
    group_label: "Level 0"
    type: string
    sql: ${TABLE}.level_0 ;;
    hidden: yes
  }

  dimension: level_1 {
    group_label: "Level 1"
    type: string
    sql: ${TABLE}.level_1 ;;
    hidden: yes
  }

  dimension: level_2 {
    group_label: "Level 2"
    type: string
    sql: ${TABLE}.level_2 ;;
    hidden: yes
  }

  dimension: level_3 {
    group_label: "Level 3"
    type: string
    sql: ${TABLE}.level_3 ;;
    hidden: yes
  }

  dimension: level_4 {
    group_label: "Level 4"
    type: string
    sql: ${TABLE}.level_4 ;;
    hidden: yes
  }

  dimension: level_5 {
    group_label: "Level 5"
    type: string
    sql: ${TABLE}.level_5 ;;
    hidden: yes
  }

  dimension: level_6 {
    group_label: "Level 6"
    type: string
    sql: ${TABLE}.level_6 ;;
    hidden: yes
  }

  dimension: level_7 {
    group_label: "Level 7"
    type: string
    sql: ${TABLE}.level_7 ;;
    hidden: yes
  }

  dimension: level_8 {
    group_label: "Level 8"
    type: string
    sql: ${TABLE}.level_8 ;;
    hidden: yes
  }

  dimension: level_9 {
    group_label: "Level 9"
    type: string
    sql: ${TABLE}.level_9 ;;
    hidden: yes
  }


  dimension: level_10 {
    group_label: "Level-10"
    type: string
    sql: ${TABLE}.level_10 ;;
    hidden: yes
  }

  dimension: level_11 {
    group_label: "Level-11"
    type: string
    sql: ${TABLE}.level_11 ;;
    hidden: yes
  }

  dimension: level_12 {
    group_label: "Level-12"
    type: string
    sql: ${TABLE}.level_12 ;;
    hidden: yes
  }

  dimension: level_13 {
    group_label: "Level-13"
    type: string
    sql: ${TABLE}.level_13 ;;
    hidden: yes
  }

  dimension: level_14 {
    group_label: "Level-14"
    type: string
    sql: ${TABLE}.level_14 ;;
    hidden: yes
  }

  dimension: level_15 {
    group_label: "Level-15"
    type: string
    sql: ${TABLE}.level_15 ;;
    hidden: yes
  }

  dimension: level_16 {
    group_label: "Level-16"
    type: string
    sql: ${TABLE}.level_16 ;;
    hidden: yes
  }

  dimension: level_17 {
    group_label: "Level-17"
    type: string
    sql: ${TABLE}.level_17 ;;
    hidden: yes
  }

  dimension: level_18 {
    group_label: "Level-18"
    type: string
    sql: ${TABLE}.level_18 ;;
    hidden: yes
  }

  dimension: level_19 {
    group_label: "Level-19"
    type: string
    sql: ${TABLE}.level_19 ;;
    hidden: yes
  }

  dimension: level_20 {
    group_label: "Level-20"
    type: string
    sql: ${TABLE}.level_20 ;;
    hidden: yes
  }


}
