#!/bin/sh

SUB_PROJECT=$1
SESSION="sp"
[[ $SUB_PROJECT ]]&& SESSION="sp-$SUB_PROJECT"
PARENT_DIR=~/redbrain/shopify-product
FLAGS="-d "

tmux new-session $FLAGS -s $SESSION -c $PARENT_DIR/$SUB_PROJECT &&

case $SUB_PROJECT in
  db)
    ENVIRONMENT=$2
    echo "db workspace preset"

    tmux send-keys      -t $SESSION:1 C-z "./sql_"$ENVIRONMENT"_proxy.sh " Enter 
    tmux split-window   -t $SESSION:1 -v -p 85 -c $PARENT_DIR/$SUB_PROJECT "$EDITOR query.sql" 
    tmux split-window   -t $SESSION:1 -h -p 75 -c $PARENT_DIR/$SUB_PROJECT "sleep 3 && ./psql_"$ENVIRONMENT".sh"

    ;;

  *)
    echo -n "unknown preset"
    ;;
esac

[[ -z $TMUX ]] && tmux a -t $SESSION:1
