#!/bin/bash

user_record="$(getent passw $USER)"
user_gecos_field="$(echo "$user_record" | cut -d ': -f 5')"
user_full_name=
