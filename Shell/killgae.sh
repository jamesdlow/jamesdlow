#!/bin/sh
kill -9 `ps -ef | grep DevAppServerMain | grep -v grep | awk '{print $2}'`