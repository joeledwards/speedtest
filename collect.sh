#! /bin/bash

# 10056  CenturyLink                    Albuquerque, NM      United States
# 16869  Plateau Telecommunications     Albuquerque, NM      United States
#  1773  Comcast                        Albuquerque, NM      United States
# 62294  Vexus                          Albuquerque, NM      United States
# 62425  Sacred Wind Communications     Albuquerque, NM      United States
#  9694  Sparklight                     Rio Rancho, NM       United States
# 38658  NMSURF                         Rio Rancho, NM       United States
#  9686  NMSURF                         Santa Fe, NM         United States
# 45706  Windstream                     Española, NM         United States
# 21638  Kitcarson                      Taos, NM             United States

#alias="centurylink"
#server="10056"

#alias="comcast"
#server="1773"

alias="vexus"
server="62294"

ts=$(date --utc +%Y%m%d_%H%M%S)
result_file_name="data/result_${server}_${alias}_${ts}.json"
result_file_path=$(readlink -f $result_file_name)

cmd="speedtest --server-id ${server} --format json --precision 6 --selection-details"

echo "Saving speedtest result to ${result_file_path}"

docker run \
  -it --rm \
  --name speedtest-collect \
  joeledwards/speedtest \
  bash -c "echo 'YES' | ${cmd}" \
  | grep serverSelection \
  > $result_file_path

