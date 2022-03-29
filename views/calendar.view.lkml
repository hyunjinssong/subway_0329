view: calendar {
  sql_table_name: `Subway_0329.calendar`
    ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.Day ;;
  }

  dimension: holiday {
    type: string
    sql: ${TABLE}.holiday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
