view: passenger {
  sql_table_name: `Subway_0329.Passenger`
    ;;

  dimension: passengercode {
    type: string
    sql: ${TABLE}.Passengercode ;;
  }

  dimension: passengertype {
    type: string
    sql: ${TABLE}.Passengertype ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
