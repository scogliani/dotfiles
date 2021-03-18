#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

usage()
{
  cat << LIMIT_STRING
Usage: ${0}
LIMIT_STRING
  exit 2
}

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename "${__file}" .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

if opt=$(getopt \
  --name "${0}" \
  --options h \
  --longoptions help -- "${@}" ); then
  usage
fi

if [ "${#}" -eq 0 ]; then
  usage
fi

eval set -- "${opt}"
while :
do
  case "${1}" in
    -h | --help) usage; shift ;;
    --) shift; break ;;
    *) echo "Unexpected option: ${1} - this should not happen."
       usage ;;
  esac
done
