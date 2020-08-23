#!/bin/bash
USERLIST=${1}
echo "USERLIST Count = ${#USERLIST[*]}"
intX=0
echo "[" > listPublicRepository.json
for user in ${USERLIST[@]}; do
  curl https://api.github.com/users/${user}/repos | jq -r '.[].name' > repository.list
  if [ $intX -eq 0 ]; then
    echo "{\"${user}\":[" >> listPublicRepository.json
  else
    echo ",{\"${user}\":[" >> listPublicRepository.json
  fi
  intX=$((++intX))
  intCount=0
  while read line
  do
    if [ $intCount -eq 0 ]; then
      echo "\"${line}\"" >> listPublicRepository.json
    else
      echo ",\"${line}\"" >> listPublicRepository.json
    fi
    intCount=$((++intCount))
    #echo "[${#USERLIST[@]}]    ${user} = ${intX}"
  done < repository.list
echo "]}" >> listPublicRepository.json
done
echo "]" >> listPublicRepository.json
echo listPublicRepository.json | jq . > sample.json

cat listPublicRepository
