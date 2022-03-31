view: dash3 {
  derived_table: {
    sql: WITH seoul_subway_ver2 AS (SELECT * FROM `mzcdsc-team-200716.Subway_0329.seoul_subway`
      )
SELECT
    (calendar.Date ) AS calendar_date_date,
    calendar.holiday  AS calendar_holiday,
    station.Station  AS station_station,
    sum(seoul_subway_ver2.Plus)  AS seoul_subway_ver2_plus
FROM seoul_subway_ver2
LEFT JOIN `Subway_0329.calendar`
     AS calendar ON seoul_subway_ver2.Date = calendar.Date
LEFT JOIN `Subway_0329.station`
     AS station ON seoul_subway_ver2.Station = station.Stationcode
GROUP BY
    1,
    2,
    3
ORDER BY
    1 DESC
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

  dimension: calendar_holiday {
    type: string
    sql: ${TABLE}.calendar_holiday ;;
  }

  dimension: station_station {
    type: string
    sql: ${TABLE}.station_station ;;
  }

  dimension: seoul_subway_ver2_plus {
    type: number
    sql: ${TABLE}.seoul_subway_ver2_plus ;;
  }

  set: detail {
    fields: [calendar_date_date, calendar_holiday, station_station, seoul_subway_ver2_plus]
  }
}
