#!/bin/bash

## COLORS
GRAY='\033[1;30m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

envValid=false
if [ "$1" == "production" ]; then envValid=true;
elif [  "$1" == "staging" ]; then envValid=true; fi

if [ "$envValid" = "true" ]  ;
then
  # no valid params passed so run prep as normal
  echo "${GRAY}⦿ environment preset : ${BLUE}$1 ${NC}\n"
  SELECTED_LANDSCAPE=$1
  SELECTED_ENVIRONMENT=$1
else
  echo "\n${GRAY}Which environment do you want to prepare?${NC}"
  select environment in "Production" "Staging"; do
    case $environment in
      Production ) SELECTED_ENVIRONMENT="production"; break;;
      Staging ) SELECTED_ENVIRONMENT="staging"; break;;
    esac
  done
  echo "${GRAY}⦿ selected environment :${BLUE}" $SELECTED_ENVIRONMENT "${NC} \n"
fi

SCRIPT_TO_EXECUTE="./scripts/landscapes/$SELECTED_ENVIRONMENT.sh"

sh $SCRIPT_TO_EXECUTE

