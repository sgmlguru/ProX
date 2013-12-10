#!/bin/sh
echo "Content-type: text/html"
echo ""
echo "Running Calabash..."
echo "Running wrapper pipeline..."
java -classpath /Applications/xmlcalabash-1.0.9-94/calabash.jar:/Applications/xmlcalabash-1.0.9-94/lib/saxon9he.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-logging-1.1.1.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-httpclient-3.1.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-codec-1.6.jar:/Applications/xmlcalabash-1.0.9-94/lib/commons-io-1.3.1.jar:/Users/System/XEP/lib/xep.jar:/Users/System/XEP/lib/xt.jar:/Applications/lib/jing.jar com.xmlcalabash.drivers.Main  --input map=file:///Users/System/Library/Containers/com.bitnami.mampstack/Data/app-5_4_9/apache2/htdocs/prox/refactor/resource-map.xml  /Users/System/Library/Containers/com.bitnami.mampstack/Data/app-5_4_9/apache2/htdocs/prox/refactor/prox-wrapper.xpl