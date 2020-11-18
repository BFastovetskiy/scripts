#!/bin/bash

cp -avr /opt/keys/* /var/opt/cprocsp/keys/root/

keytool -list -provider ru.CryptoPro.JCP.JCP -keypass 123456 -storetype HDImageStore -keystore NONE -storepass 123456

java ${JAVA_PARAM} -jar -Dserver.port=${PORT} -Dkey.alias=${ALIAS} -Dkey.password=${PASSWORD} app/app.war
