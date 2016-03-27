echo "========================================================================"
echo " You can now connect to this ShadowSocks server:"
echo ""
echo " server: $SS_SERVER_ADDR  port: 8388 password: $SS_PASSWORD  "
echo " timeout: $SS_TIMEOUT  encryption method: $SS_METHOD "
echo ""
echo " Please remember the password!"
echo "========================================================================"

ssserver -s $SS_SERVER_ADDR -p 8388 -k $SS_PASSWORD -m $SS_METHOD -t $SS_TIMEOUT
