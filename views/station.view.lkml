view: station {
  sql_table_name: `Subway_0329.station`
    ;;

  dimension: linecode {
    type: number
    sql: ${TABLE}.Linecode ;;
  }

  dimension: station {
    type: string
    sql: ${TABLE}.Station ;;
  }

  dimension: stationcode {
    type: number
    sql: ${TABLE}.Stationcode ;;
  }

  dimension: transfer_num {
    type: number
    sql: ${TABLE}.Transfer_num ;;
  }

  dimension: transfer_type {
    type: string
    sql: ${TABLE}.Transfer_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
