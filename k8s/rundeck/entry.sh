#!/bin/bash
set -eou pipefail

sed -i 's|localhost:4440|'"${RUNDECK_GRAILS_URL:-localhost:4440}"'|g' /etc/rundeck/rundeck-config.properties

echo -e "\n# GUI customization" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.staticUserResources.enabled=${RD_GUI_STATIC_RESOURCES:-false}" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.instanceName=${RD_GUI_INSTANCE_NAME:-T-Systems PoC}" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.instanceNameLabelColor=#e20074" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.instanceNameLabelTextColor=#FFFFFF" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.title=${RD_GUI_INSTANCE_NAME:-T-Systems PoC}" >> /etc/rundeck/rundeck-config.properties
echo "rundeck.gui.login.welcome=${RD_GUI_LOGIN_WELCOME:-Welcome to AWX-Lab Instance}" >> /etc/rundeck/rundeck-config.properties

sudo /etc/init.d/rundeckd start
tail -f $RUNDECK_LOG/service.log
