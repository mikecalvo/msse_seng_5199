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
