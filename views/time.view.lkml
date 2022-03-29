view: time {
  sql_table_name: `Subway_0329.Time`
    ;;

  dimension: time {
    type: string
    sql: ${TABLE}.Time ;;
  }

  dimension: timecode {
    type: number
    sql: ${TABLE}.Timecode ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
