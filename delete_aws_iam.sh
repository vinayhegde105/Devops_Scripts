#!/bin/bash

user_name="ado_migration"

echo "Removing user: ${user_name}"

echo "Deleting Access Keys:"
keys=("$(aws iam list-access-keys --user-name "${user_name}" | jq -r '.AccessKeyMetadata[] | .AccessKeyId')")
if [[ "${#keys}" -gt "0" ]]; then
    # shellcheck disable=SC2068
    for key in ${keys[@]}; do
        echo -e "\tDeleting access key ${key}"
        aws iam delete-access-key --user-name "${user_name}" --access-key-id "${key}"
    done
fi

echo "Deleting service-specific-credentials Keys:"
sp_keys=("$(aws iam list-service-specific-credentials --user-name "${user_name}" | jq -r '.ServiceSpecificCredentials[] | .ServiceSpecificCredentialId')")
if [[ "${#sp_keys}" -gt "0" ]]; then
    # shellcheck disable=SC2068
    for sp_key in ${sp_keys[@]}; do
        echo -e "\tDeleting service-specific-credentials ${sp_key}"
        aws iam delete-service-specific-credential --user-name "${user_name}" --service-specific-credential-id "${sp_key}"
    done
fi

echo "Removing Attached User Policies:"
pols=("$(aws iam list-attached-user-policies --user-name "${user_name}" | jq -r '.AttachedPolicies[] | .PolicyArn')")
if [[ "${#pols}" -gt "0" ]]; then
    # shellcheck disable=SC2068
    for policy in ${pols[@]}; do
        echo -e "\tDetaching user policy $(basename "${policy}")"
        aws iam detach-user-policy \
        --user-name "${user_name}" \
        --policy-arn "${policy}"
    done
fi

echo "Deleting User"
 aws iam delete-user --user-name "${user_name}"
