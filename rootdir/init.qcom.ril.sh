#!/system/bin/sh
export PATH=/system/xbin:$PATH

product=`getprop ro.build.product`
case "$product" in
	"w7" | "jag3gds" | "jagnm" | "g2m" | "w5" | "w3ds" )
	setprop gsm.version.baseband `strings /firmware/image/modem.b21 | grep "^M8626A-" | head -1`
	;;
	"f520" )
	setprop gsm.version.baseband `strings /firmware/image/modem.b22 | grep "^MPSS.DI" | head -1`
	;;
esac

multisim=`getprop persist.radio.multisim.config`

if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
    start ril-daemon1
fi
