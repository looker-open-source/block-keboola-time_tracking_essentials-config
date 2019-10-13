view: user {
  sql_table_name: USER ;;

  dimension: user_id {
    label: "User ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
    html: <a href={{user_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}."ROLE" ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
    html: <a href={{user_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: user_active {
    type: string
    sql: ${TABLE}."USER_ACTIVE" ;;
  }

  dimension: user_url {
    hidden: yes
    type: string
    sql: ${TABLE}."USER_URL" ;;
  }

  measure: count {
    type: count
    drill_fields: [user, entry.count]
  }
}
