view: entry {
  sql_table_name: ENTRY ;;

  dimension: entry_id {
    label: "Entry ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."ENTRY_ID" ;;
    html: <a href={{entry_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: task_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TASK_ID" ;;
  }

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."START_TIME" ;;
  }

  dimension: billable {
    type: string
    sql: ${TABLE}."BILLABLE" ;;
  }

  dimension: billed {
    type: string
    sql: ${TABLE}."BILLED" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: entry_url {
    hidden: yes
    type: string
    sql: ${TABLE}."ENTRY_URL" ;;
  }

  dimension: is_deleted {
    type: string
    sql: ${TABLE}."IS_DELETED" ;;
  }

  dimension: within_budget {
    type: string
    sql: ${TABLE}."WITHIN_BUDGET" ;;
  }

  dimension: budget_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BUDGET" ;;
  }

  dimension: budget_use_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BUDGET_USE" ;;
  }

  dimension: billable_hours_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BILLABLE_HOURS" ;;
  }

  dimension: billable_price_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BILLABLE_PRICE" ;;
  }

  dimension: hour_rate_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."HOUR_RATE" ;;
  }

  dimension: hours_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."HOURS" ;;
  }

  dimension: price_original_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."PRICE_ORIGINAL" ;;
  }

  measure: hours {
    description: "All recorded hours."
    type: sum
    sql: ${hours_dimension} ;;
    drill_fields: [detail*, hours]
  }

  measure: billable_hours {
    description: "Hours flagged as billable."
    type: sum
    sql: ${billable_hours_dimension} ;;
    drill_fields: [detail*, billable_hours]
  }

  measure: hour_rate {
    label: "Avg. Hour Rate"
    type: average
    sql: ${hour_rate_dimension} ;;
    drill_fields: [detail*, hour_rate]
  }

  measure: price_original {
    description: "Task hour price * entry duration (before over budget adjustment)."
    type: sum
    sql: ${price_original_dimension} ;;
    drill_fields: [detail*, price_original]
  }

  measure: billable_price {
    description: "Adjusted price of the hours according to the budget (if hours are over budget, price is set to 0)."
    type: sum
    sql: ${billable_price_dimension} ;;
    drill_fields: [detail*, billable_price]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project.project,
      task.task_name,
      task.tasklist_name,
      entry_id,
      description,
      start_date
    ]
  }
}
