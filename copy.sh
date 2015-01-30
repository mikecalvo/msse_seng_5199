#!/bin/bash

SITE_BASE=../mikecalvo.github.io/msse
if [[ ! -d "${SITE_BASE}/assignments" ]] ; then
  echo 'Creating dir ${SITE_BASE}/assignments/'
  mkdir "${SITE_BASE}/assignments"
fi

for i in 1 2 3
do
  if [[ ! -d "${SITE_BASE}/assignments/${i}" ]] ; then
    echo "Creating dir ${SITE_BASE}/assignments/${i}"
    mkdir "${SITE_BASE}/assignments/${i}"
  fi
  cp assignments/assignment${i}.md ${SITE_BASE}/assignments/${i}/index.md
done

find week* -name "*.md" -print | sort -nr | while read -r i; do
  IFS='/' read -ra PARTS <<< "$i"
  NAME="${PARTS[1]}"
  NAME="${NAME%%.*}"

  if [[ ! -d "${SITE_BASE}/notes/${NAME}" ]] ; then
    mkdir "${SITE_BASE}/notes/${NAME}"
  fi

  DEST="${SITE_BASE}/notes/${NAME}/index.md"
  echo "Copying ${i} to ${DEST}"
  cat "slide_header.md" > "${DEST}"
  sed '1,2d' ${i} >> "${DEST}"
done
# while read -r f; do
#  echo "$f"
# done < <(find "week*" -name "*.md" -printf "%k KB %p\n" | sort -nr)
