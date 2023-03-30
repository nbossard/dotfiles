# Refer to https://github.com/wez/wezterm/issues/522#issuecomment-902203635
echo "\x1b]1337;SetUserVar=panetitle=$(echo $1 | base64)\x07"
