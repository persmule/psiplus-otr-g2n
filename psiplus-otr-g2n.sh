#!/bin/sh

# Copyright (c) 2017 Persmule. All Rights Reserved.
#
# The library is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
# 
# The library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA 



g2n() {
    xmlstarlet sel -N x="http://psi-im.org/options" -t -v "/x:accounts/x:accounts/*[x:id=\"${1}\"]/x:jid" "${2}";
}

getguid() {
    grep -o '{.*}' "${1}";
}

mkregex() {
    printf 's/%s/%s\//g' ${1} $(g2n ${1} "${2}");
}

if [ ${#} -lt 2 ]; then
   echo "usage: ${0} <psi+ otr key file> <account xml file> <converted key file>"
   exit 0
elif which xmlstarlet > /dev/null; then
    l_guid=$(getguid "${1}");
    cp "${1}" "${3}"
    for g in ${l_guid};
    do {
	sed -i "$(mkregex ${g} ${2})" "${3}"
    } 
    done
else
    echo "This script needs xmlstarlet. Please install it first!"
    exit 1
fi
