#!/bin/bash
DATE=$(date +%Y%m%d-%H%M%S)

rsync -rav /tmp/deploy/blog/ /opt/applications/blog > /var/log/deploy_blog_${DATE}.log
rsync -rav /tmp/deploy/corporate/ /opt/applications/corporate > /var/log/deploy_corp_${DATE}.log

chown -R www-data. /opt/applications/
