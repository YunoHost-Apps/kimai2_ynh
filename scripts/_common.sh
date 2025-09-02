#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

#REMOVEME? composer_version=2.3.3

boolstr() {
    BOOLSTR=( false true )
    echo "${BOOLSTR[$1]}"
}
