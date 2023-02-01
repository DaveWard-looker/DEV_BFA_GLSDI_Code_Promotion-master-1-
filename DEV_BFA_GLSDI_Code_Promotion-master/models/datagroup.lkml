####################################### Data group created for the PDT for the Faster Data Load in looker ###################################

datagroup:  BFA_glsdi_datagroup_current_year {
  sql_trigger: select * from @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_CURRENT_PERIOD;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "10 minute"
  interval_trigger: "10 minute"
}


datagroup: BFA_glsdi_datagroup_previous_year {
  sql_trigger: select * from @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_PREVIOUS_YEAR;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}


datagroup: BFA_glsdi_datagroup_previous_period {
  sql_trigger: select * from @{server_name_fire}.@{schema_name}.FOTC_DP_CE_GL_DETAIL_OUTPUT_PREVIOUS_PERIOD;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_average_b_s_mica {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_MICA' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}


datagroup: BFA_Global_Standard_Product {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='Global_Standard_Product'  ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_cost_centre {
  sql_trigger:select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='FTP_COSTCENTRE';;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "10 minute"
  interval_trigger: "10 minute"
}

datagroup: BFA_FTP_GOCA_ACCOUNT {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='FTP_GOCA_ACCOUNT';;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_FTP_SUMMARY_CUSTOMER_TYPE {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='FTP_SUMMARY_CUSTOMER_TYPE' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_FTP_SUMMARY_PRODUCT {
  sql_trigger:  select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='FTP_SUMMARY_PRODUCT' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_MI_FUNCTION {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_FUNCTION';;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: Global_Standard_Product {
  sql_trigger: select from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='Global_Standard_Product' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"

}

datagroup: BFA_Global_Standard_Segment {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='Global_Standard_Segment' and dimension_tree_id ='1' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_MI_GLOBALBUSINESS {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_GLOBALBUSINESS' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"

}

datagroup: BFA_SARACEN_GRCA {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='SARACEN_GRCA' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"

}

datagroup: BFA_MI_PRODUCT {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_PRODUCT' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
}

datagroup: BFA_Control_SARACEN_GRCA {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='SARACEN_GRCA' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"

}

datagroup: BFA_Control_average_b_s_mica {
  sql_trigger: select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_MICA' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
  max_cache_age: "24 hour"
  # interval_trigger: "1 minute"
}

datagroup: BFA_Entity {
  sql_trigger:  select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_ENTITY' ;;
  label: "Data Refresh"
  description: "ETL Refresh"
 # max_cache_age: "24 hour"
  interval_trigger: "5 minute"
}
