view: seoul_subway {
  sql_table_name: `Subway_0329.seoul_subway`
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

  dimension: in {
    type: number
    sql: ${TABLE}.`In` ;;
  }

  dimension: linecode {
    type: number
    sql: ${TABLE}.Linecode ;;
  }

  dimension: out {
    type: number
    sql: ${TABLE}.Out ;;
  }

  dimension: plus {
    type: number
    sql: ${TABLE}.Plus ;;
  }

  dimension: station {
    type: number
    sql: ${TABLE}.Station ;;
  }

  dimension: sub {
    type: number
    sql: ${TABLE}.Sub ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }

  dimension: case {
    type: string
    sql:
    case when (${TABLE}.Time = 6 OR ${TABLE}.Time = 7) then "출근시간"

    ELSE NULL
    END;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
