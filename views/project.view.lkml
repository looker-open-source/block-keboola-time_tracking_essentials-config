view: project {
  sql_table_name: PROJECT ;;

  dimension: project_id {
    label: "Project ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."PROJECT_ID" ;;
    html: <a href={{project_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: client_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CLIENT_ID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension: billable {
    type: string
    sql: ${TABLE}."BILLABLE" ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}."NAME" ;;
    html: <a href={{project_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: project_active {
    type: string
    sql: ${TABLE}."PROJECT_ACTIVE" ;;
  }

  dimension: project_rate {
    type: number
    sql: ${TABLE}."PROJECT_RATE" ;;
  }

  dimension: project_url {
    hidden: yes
    type: string
    sql: ${TABLE}."PROJECT_URL" ;;
  }

  dimension: budget_hours_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BUDGET_HOURS" ;;
  }

  measure: budget_hours {
    type: sum
    sql: ${budget_hours_dimension} ;;
  }

  measure: count {
    type: count
    drill_fields: [project, client.client, task.count]
  }
}
