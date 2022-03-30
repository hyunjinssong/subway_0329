view: dashboard3 {
  derived_table: {
    sql: SELECT * FROM `mzcdsc-team-200716.Subway_0329.seoul_subway`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }

  dimension: linecode {
    type: number
    sql: ${TABLE}.Linecode ;;
  }

  dimension: station {
    type: number
    sql: ${TABLE}.Station ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  dimension: in {
    type: number
    sql: ${TABLE}.`In` ;;
  }

  dimension: out {
    type: number
    sql: ${TABLE}.Out ;;
  }

  dimension: plus {
    type: number
    sql: ${TABLE}.Plus ;;
  }

  dimension: sub {
    type: number
    sql: ${TABLE}.Sub ;;
  }

  set: detail {
    fields: [
      date,
      time,
      linecode,
      station,
      type,
      in,
      out,
      plus,
      sub
    ]
  }
}
