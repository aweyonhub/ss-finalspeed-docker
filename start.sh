echo "========================================================================"
echo " You can now connect to this ShadowSocks server:"
echo ""
echo " server: $SS_SERVER_ADDR  port: $SS_SERVER_PORT password: $SS_PASSWORD  "
echo " timeout: $SS_TIMEOUT  encryption method: $SS_METHOD "
echo ""
echo " Please remember the password!"
echo "========================================================================"
sh /fs/restart.sh
ssserver -s $SS_SERVER_ADDR -p $SS_SERVER_PORT -k $SS_PASSWORD -m $SS_METHOD -t $SS_TIMEOUT
