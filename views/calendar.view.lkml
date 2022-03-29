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
    order_by_field: day_number

  }

  dimension: day_number {
    type: string
    sql:
    CASE
    WHEN ${TABLE}.Day = '월요일'  THEN '1'
    WHEN ${TABLE}.Day = '화요일'  THEN '2'
    WHEN ${TABLE}.Day = '수요일'  THEN '3'
    WHEN ${TABLE}.Day = '목요일'  THEN '4'
    WHEN ${TABLE}.Day = '금요일'  THEN '5'
    WHEN ${TABLE}.Day = '토요일'  THEN '6'
    WHEN ${TABLE}.Day = '일요일'  THEN '7'
    ELSE NULL
    END ;;
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
