view: workday {
  sql_table_name: WORKDAY ;;

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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: workday {
    type: string
    sql: ${TABLE}."WORKDAY" ;;
  }

  measure: workdays {
    type: count_distinct
    sql: ${TABLE}."DATE" ;;
    filters: {
      field: workday
      value: "true"
    }
  }

  measure: billable_capacity {
    type: number
    sql: ${workdays}*8 ;;
  }

  measure: billable_target {
    description: "This should be change accordingly to your needs. Default is 6 Billable hours per day."
    type: number
    sql: ${billable_capacity}*0.6 ;;
  }

  measure: count {
    type: count
  }
}
