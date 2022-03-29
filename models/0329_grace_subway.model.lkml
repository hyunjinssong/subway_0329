connection: "grace_0329"

# include all the views
include: "/views/**/*.view"

datagroup: 0329_grace_subway_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 0329_grace_subway_default_datagroup

explore: calendar {}

explore: station {}

explore: seoul_subway {}

explore: time {}

explore: passenger {}
