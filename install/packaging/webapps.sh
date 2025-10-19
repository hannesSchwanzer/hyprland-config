WEBAPPS_JSON="$INSTALL_SCRIPT_LOCATION/webapps.json"

for row in $(jq -c '.[]' "$WEBAPPS_JSON"); do
  APP_NAME=$(echo "$row" | jq -r '.name')
  APP_URL=$(echo "$row" | jq -r '.url')
  ICON_REF=$(echo "$row" | jq -r '.icon')
  CUSTOM_EXEC=$(echo "$row" | jq -r '.custom_exec // empty')
  MIME_TYPES=$(echo "$row" | jq -r '.mime_types // empty')

  omarchy-webapp-install "$APP_NAME" "$APP_URL" "$ICON_REF" "$CUSTOM_EXEC" "$MIME_TYPES"
done
