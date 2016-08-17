#!/usr/bin/env python

import ConfigParser
import os

CONF_DIR = '/home/pi/.config/geany'
CONF_FILE = 'geany.conf'
CONF_PATH = '%s/%s' % (CONF_DIR, CONF_FILE)

config=ConfigParser.RawConfigParser()
config.add_section('build-menu')
config.set('build-menu','NF_00_LB','_Compile')
config.set('build-menu','NF_00_CM','mvn compile')
config.set('build-menu','NF_00_WD','%p')
config.set('build-menu','NF_01_LB','_Other targets')
config.set('build-menu','NF_01_CM','mvn')
config.set('build-menu','NF_01_WD','%p')
config.set('build-menu','NF_02_LB','_Test')
config.set('build-menu','NF_02_CM','mvn test')
config.set('build-menu','NF_02_WD','%p')
config.set('build-menu','NF_03_LB','_Package')
config.set('build-menu','NF_03_CM','mvn package')
config.set('build-menu','NF_03_WD','%p')
config.set('build-menu','error_regex','\[ERROR\] ([^:\[]+):?\[([0-9]+)')

if not os.path.exists(CONF_DIR):
    os.makedirs(CONF_DIR)

with open(CONF_PATH, 'wb') as configfile:
    config.write(configfile)

