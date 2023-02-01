view: global_standard_segment_h {
    label: "Global Standard Segment"
    extension: required

    set:  Global_Standard_Segment_description_fields {
      fields: [ Global_Standard_Segment_leaf_description, Global_Standard_Segment_description_0, Global_Standard_Segment_description_1, Global_Standard_Segment_description_2, Global_Standard_Segment_description_3, Global_Standard_Segment_description_4]}

    set:  Global_Standard_Segment_level_fields {
      fields: [ Global_Standard_Segment_leaf, Global_Standard_Segment_level_0, Global_Standard_Segment_level_1, Global_Standard_Segment_level_2, Global_Standard_Segment_level_3, Global_Standard_Segment_level_4]
    }

    dimension:  Global_Standard_Segment_description_0 {
      label: "Description 0"
      view_label: "Global Standard Segment"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${description_0} end;;
      drill_fields: [ Global_Standard_Segment_description_fields*]
    }

    dimension:  Global_Standard_Segment_level_0 {
      label: "Level 0"
      view_label: "Global Standard Segment"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.level_0 end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]
    }


    dimension:  Global_Standard_Segment_description_1 {
      label: "Description 1"
      view_label: "Global Standard Segment"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${description_1} end;;
      drill_fields: [ Global_Standard_Segment_description_fields*]
    }

    dimension:  Global_Standard_Segment_level_1 {
      label: "Level 1"
      view_label: "Global Standard Segment"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.level_1 end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]
    }


    dimension:  Global_Standard_Segment_description_2 {
      label: "Description 2"
      view_label: "Global Standard Segment"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${description_2} end;;
      drill_fields: [ Global_Standard_Segment_description_fields*]
    }

    dimension:  Global_Standard_Segment_level_2 {
      label: "Level 2"
      view_label: "Global Standard Segment"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.level_2 end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]
    }

    dimension:  Global_Standard_Segment_description_3 {
      label: "Description 3"
      view_label: "Global Standard Segment"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${description_3} end;;
      drill_fields: [ Global_Standard_Segment_description_fields*]
    }

    dimension:  Global_Standard_Segment_level_3 {
      label: "Level 3"
      view_label: "Global Standard Segment"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.level_3 end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]
    }

    dimension:  Global_Standard_Segment_description_4 {
      label: "Description 4"
      view_label: "Global Standard Segment"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${description_4} end;;
      drill_fields: [ Global_Standard_Segment_description_fields*]
    }

    dimension:  Global_Standard_Segment_level_4 {
      label: "Level 4"
      view_label: "Global Standard Segment"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.level_4 end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]
    }


    dimension:  Global_Standard_Segment_leaf {
      label: "Leaf"
      view_label: "Global Standard Segment"
      group_label: "Leaf"
      description: "Lowest Level of CostCentre Hierarchy"
      type: string
      #primary_key: yes
      sql: case when ${dimension}=" Global_Standard_Segment" then ${TABLE}.code end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]

    }

    dimension:  Global_Standard_Segment_leaf_description {
      label: "Leaf Description"
      view_label: "Global Standard Segment"
      group_label: "Leaf"
      description: "Lowest Level of CostCentre Hierarchy"
      type: string
      # primary_key: yes
      sql: case when ${dimension}=" Global_Standard_Segment" then  ${TABLE}.leaf_description end ;;
      drill_fields: [ Global_Standard_Segment_level_fields*]

    }
  }
