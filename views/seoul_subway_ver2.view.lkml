view: seoul_subway_ver2 {
  derived_table: {
    sql: SELECT * FROM `mzcdsc-team-200716.Subway_0329.seoul_subway`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.Date, ${TABLE}.Time, ${TABLE}.Type, ${TABLE}.Station) ;;
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

  dimension: comparsion {
    type: number
    value_format_name: percent_0
    sql: ((${TABLE}.Plus)/
    (${TABLE}.Plus
WITH seoul_subway_ver2 AS (SELECT * FROM `mzcdsc-team-200716.Subway_0329.seoul_subway`
      )
SELECT
    (seoul_subway_ver2.Date ) AS seoul_subway_ver2_date,
    COALESCE(SUM(CAST(seoul_subway_ver2.Plus AS FLOAT64)), 0) AS plus_sum3
FROM seoul_subway_ver2
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 1
    ) ;;



    html: {% if value > 0 %}
         <p style="color: #990000">▲  {{ rendered_value }}</p>
      {% elsif value < 0 %}
        <p style="color: #009900">▼  {{ rendered_value }}</p>
      {% else %}
        <p style="color: #000000">{{ rendered_value }}</p>
      {% endif %} ;;
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
