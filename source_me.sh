#!/bin/bash

function create_eqlike_function () {
    NAME=$1
    OP=$2
    eval "
        function ${NAME} () {
            if [[ "$1" ${OP} "$2" ]]; then
                return 0
            else
                return 1
            fi
        }"
}

function create_test_function () {
    NAME=$1
    OP=$2

    A=hallo
    B=tschuess
    C=hallo

    eval "
        if [[ \$A $OP \$B ]]; then
            if [[ \$A $OP \$B ]]; then
                echo \"OK: $A $OP $B\"
            else
                echo \"ERROR: $A $OP $B\"
            fi
        else
            if [[ ! \$A $OP \$B ]]; then
                echo \"OK: ! $A $OP $B\"
            else
                echo \"ERROR: $A $OP $B\"
            fi
        fi
        
        if [[ \$A $OP \$C ]]; then
            if [[ \$A $OP \$C ]]; then
                echo \"OK: $A $OP $C\"
            else
                echo \"ERROR: $A $OP $C\"
            fi
        else
            if [[ ! \$A $OP \$C ]]; then
                echo \"OK: ! $A $OP $C\"
            else
                echo \"ERROR: $A $OP $C\"
            fi
        fi
    "
}

function create_and_test_eqlike_function () {
    NAME=$1
    OP=$2
    create_eqlike_function $NAME $OP
    create_test_function $NAME $OP
}


create_and_test_eqlike_function "eq" "=="
create_and_test_eqlike_function "ne" "!="

create_and_test_eqlike_function "ge" "-ge"
create_and_test_eqlike_function "gt" "-gt"
create_and_test_eqlike_function "le" "-le"
create_and_test_eqlike_function "lt" "-lt"
