#!/usr/bin/env ash

exec websocketd \
  "--port=$WS_PORT" \
  "pg_listen" \
  "$PG_URL" \
  "$PG_CHANNEL"