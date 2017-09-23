# Usage:
#   source hash.sh
#   get_hash file.mp4
#
# Author: Rogério Carvalho Schneider <stockrt@gmail.com>

get_hash() {
  readsize=$((64 * 1024))
  data=$(head -c $readsize "$1" | base64)
  data+=$(tail -c $readsize "$1" | base64)
  base64 -d <<< "$data" | md5sum | awk '{print $1}'
}
