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

explore: dashboard2 {}

explore: dashboard3 {}

explore: dash3 {}

explore: dashboard5 {}

explore: seoul_subway_ver2 {
  join: calendar {
    type: left_outer
    sql_on: ${seoul_subway_ver2.date} = ${calendar.date_date} ;;
    relationship: one_to_many
  }
  join: station {
    type: left_outer
    sql_on: ${seoul_subway_ver2.station} = ${station.stationcode} ;;
    relationship: one_to_many
  }
  join: date_sum_plus {
    type: left_outer
    sql_on: ${seoul_subway_ver2.date} = ${date_sum_plus.calendar_date_date} ;;
    relationship: one_to_many
  }
}
