#!/usr/bin/bash
# Source https://gist.github.com/Nervengift/844a597104631c36513c
# choose pulseaudio sink via rofi or dmenu
# changes default sink and moves all streams to that sink

#sink=$(ponymix -t sink list|awk '/^sink/ {s=$1" "$2;getline;gsub(/^ +/,"",$0);print s" "$0}'|rofi -dmenu -p 'pulseaudio sink:' -location 6 -width 100|grep -Po '[0-9]+(?=:)') &&

# alternate version using dmenu:
# sink=$(ponymix -t sink list|awk '/^sink/ {s=$1" "$2;getline;gsub(/^ +/,"",$0);print s" "$0}'|dmenu -p 'pulseaudio sink:'|grep -Po '[0-9]+(?=:)') &&

#ponymix set-default -d $sink &&
#for input in $(ponymix list -t sink-input|grep -Po '[0-9]+(?=:)');do
	#echo "$input -> $sink"
	#ponymix -t sink-input -d $input move $sink
#done

##################################################
# Source https://codeaddict.org/posts/rofi-pulse/
# Choose pulseaudio sink/source via rofi.
# Changes default sink/source and moves all streams to that device.
#
# based on: https://gist.github.com/Nervengift/844a597104631c36513c
#

set -euo pipefail

readonly type="$1"
if [[ ! "$type" =~ (sink|source) ]]; then
    echo "error: unknown type: $type"
    exit 1
fi

function formatlist {
    awk "/^$type/ {s=\$1\" \"\$2;getline;gsub(/^ +/,\"\",\$0);print s\" \"\$0}"
}

list=$(ponymix -t $type list | formatlist)
default=$(ponymix defaults | formatlist)
# line number of default in list (note: row starts at 0)
default_row=$(echo "$list" | grep -nr "$default" - | cut -f1 -d: | awk '{print $0-1}')

device=$(
    echo "$list" \
        | rofi -dmenu -p "pulseaudio $type:" -selected-row $default_row \
        | grep -Po '[0-9]+(?=:)'
)

# Set device as default.
ponymix set-default -t $type -d $device

# Move all streams to the new sink/source.
case "$type" in
    sink)
        for input in $(ponymix list -t sink-input|grep -Po '[0-9]+(?=:)');do
            echo "moving stream sink $input -> $device"
            ponymix -t sink-input -d $input move $device
        done
        ;;

    source)
        for output in $(ponymix list -t source-output | grep -Po '[0-9]+(?=:)'); do
            echo "moving stream source $output <- $device"
            ponymix -t source-output -d $output move $device
        done
        ;;
esac
