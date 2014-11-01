#!/bin/sh
appenginedir=/Applications/Eclipse/plugins/$appenginebundle`ls -r /Applications/Eclipse/plugins/ | grep com.google.appengine.eclipse.sdkbundle | head -1`
appenginebin=$appenginedir/`ls $appenginedir | grep appengine-java-sdk`/bin
chmod u+x $appenginebin/*
echo $appenginebin/appcfg.sh
#$appenginebin/appcfg.sh rollback `pwd`/war
$appenginebin/appcfg.sh $@