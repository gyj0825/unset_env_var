#!/bin/bash
#include this file and call unset_env_vars
function unset_env_vars() {
  local all_vars="${ALL_UNSET_VARS}"
  # Find all unset var in the $ALL_UNSET_VARS separated by ","
  IFS=',' read -a vars_list <<< $all_vars
  if [ -n "$vars_list" ];then
    for unset_var in ${vars_list[@]};do
       var_exist=`grep "unset ${unset_var}" ~/.bashrc`
       if [ ! "$var_exist" ];then
          sed -i '$a unset '${unset_var}'' ~/.bashrc
       fi
    done
  fi
}
