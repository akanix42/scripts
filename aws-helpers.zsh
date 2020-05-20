function get_aws_account_id() {
  aws sts get-caller-identity | jqr .Account
}

function load_node_aws_profile() {
  local node="$1"
  instance="$(
    ssh "${node}" "curl \
      --noproxy '*' \
      --silent \
      http://169.254.169.254/latest/dynamic/instance-identity/document"
  )"

  local account_id="$(cat <<< $instance | jqr .accountId)"
  local region="$(cat <<< $instance | jqr .region)"
  export AWS_PROFILE="$(get_aws_profile "${account_id}" "${region}")"
  AWS_ACCOUNT_ID="${account_id}"
  AWS_REGION="${region}"
}

function get_arn() {
  local service="$1"
}