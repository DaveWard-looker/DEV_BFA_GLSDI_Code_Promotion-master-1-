project_name: "BFA_SDI_Data_Discovery"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

constant: connection_name {
  value: "discovery_datamart_connection"
  export: override_required
}

constant: schema_name {
  value: "DISCOVERY"
  export: override_required
}

constant: connection_fine_name {
  value: "discovery_fine_connection"
  export: override_required
}

constant: server_name_fire {
  value: "hsbc-11292271-insrepoe-dev"
  export: override_required
}

constant: server_name_fine {
  value: "hsbc-11292271-inscalce-dev"
  export: override_required
}
