view: date_sum_plus {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'calendar.date_date'


      WITH seoul_subway_ver2 AS (SELECT * FROM `mzcdsc-team-200716.Subway_0329.seoul_subway`
      )
      SELECT
      (calendar.Date ) AS calendar_date_date,
      ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( CAST(seoul_subway_ver2.Plus AS FLOAT64) ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( CONCAT(seoul_subway_ver2.Date, seoul_subway_ver2.Time, seoul_subway_ver2.Type, seoul_subway_ver2.Station)   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( CONCAT(seoul_subway_ver2.Date, seoul_subway_ver2.Time, seoul_subway_ver2.Type, seoul_subway_ver2.Station)   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( CONCAT(seoul_subway_ver2.Date, seoul_subway_ver2.Time, seoul_subway_ver2.Type, seoul_subway_ver2.Station)   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( CONCAT(seoul_subway_ver2.Date, seoul_subway_ver2.Time, seoul_subway_ver2.Type, seoul_subway_ver2.Station)   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS plus_sum
      FROM seoul_subway_ver2
      LEFT JOIN `Subway_0329.calendar`
      AS calendar ON seoul_subway_ver2.Date = calendar.Date
      GROUP BY
      1
      ORDER BY
      1
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: calendar_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.calendar_date_date ;;
  }

  dimension: plus_sum {
    type: number
    sql: ${TABLE}.plus_sum ;;
  }

  set: detail {
    fields: [calendar_date_date, plus_sum]
  }
}
