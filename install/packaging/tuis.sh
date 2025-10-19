TUI_JSON="$INSTALL_SCRIPT_LOCATION/tuis.json"

for row in $(jq -c '.[]' "$TUI_JSON"); do
  APP_NAME=$(echo "$row" | jq -r '.name')
  APP_EXEC=$(echo "$row" | jq -r '.exec')
  WINDOW_STYLE=$(echo "$row" | jq -r '.window_style')
  ICON_URL=$(echo "$row" | jq -r '.icon')

  omarchy-tui-install "$APP_NAME" "$APP_EXEC" "$WINDOW_STYLE" "$ICON_URL"
done
