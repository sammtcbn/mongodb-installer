#!/bin/bash

dlver=5.0.4
dlfile=mongodb-linux-x86_64-ubuntu2004-${dlver}.tgz
dlurl=https://fastdl.mongodb.org/linux/${dlfile}
foldername=mongodb-linux-x86_64-ubuntu2004-${dlver}

CURRDIR=$(cd $(dirname $0) && pwd)

if [ ! -f ${dlfile} ];then
  curl -f --output ${dlfile} ${dlurl}  || exit 1
fi

rm -rf ${foldername} || exit 1
tar zxfv ${dlfile} || exit 1

mv -f ${foldername} mongodb || exit 1

echo "done"
