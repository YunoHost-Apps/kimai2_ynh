#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

boolstr() {
    BOOLSTR=( false true )
    echo "${BOOLSTR[$1]}"
}
