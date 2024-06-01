#!/usr/bin/env bash
set -e

DNS_ACTION="${1}"
DNS_HOSTNAME="${2}"
RECORD_TYPE="${3}"
DATA_VALUE="${4}"

EXIT_CODE=0

if [ "${DNS_ACTION}" = 'remove' ]
then
    ANSWER="$(curl -s -X DELETE "https://api.gandi.net/v5/livedns/domains/${GANDI_DOMAIN}/records/${DNS_HOSTNAME}/${RECORD_TYPE}" \
        -H "Authorization: Bearer ${GANDI_PAT}")" \
        || EXIT_CODE=${?}
else
    ANSWER="$(curl -s -X POST "https://api.gandi.net/v5/livedns/domains/${GANDI_DOMAIN}/records/${DNS_HOSTNAME}/${RECORD_TYPE}" \
        -H 'accept: application/json' \
        -H 'Content-Type: application/json' \
        -H "Authorization: Bearer ${GANDI_PAT}" \
        -d '{"rrset_values":["'"${DATA_VALUE}"'"],"rrset_ttl":'"${GANDI_TTL}"'}')" \
        || EXIT_CODE=${?}
fi

if [ "${ANSWER}" != '' ]
then
    echo "${ANSWER}"
fi

exit ${EXIT_CODE}
