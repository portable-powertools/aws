path_add PYTHONPATH "$mod_aws_root/src"

export EC1=i-0b8f18657ec6d1ef3
export EC_default="$EC1"

export EC_key="$mod_aws_root/../admin_frankfurt.pem"
export EC_user=ubuntu

ECSSH() {
    local dns
    if [[ -n "${1+set}" ]]; then
        local id="$1"
        shift
    else
        local id="$EC_default"
    fi
    dns="$(ECGetDNS "$id")" 1>/dev/null || return 1
    ssh "${EC_user}@$dns" -i "$EC_key" "$@"
    # ssh ubuntu@ec2-3-121-186-114.eu-central-1.compute.amazonaws.com -i "$key"
}
function ECStart() {
    local cmd="start-instances --instance-ids"
    local id="${1:-$EC_default}"
    ECDo "$cmd" "$id"
}
function ECStop() {
    local cmd="stop-instances --instance-ids"
    local id="${1:-$EC_default}"
    ECDo "$cmd" "$id"
}
function ECRunning() {
    local cmd="describe-instance-status --instance-ids"
    local id="${1:-$EC_default}"
    ECDo "$cmd" "$id" | grep running 1>&2
}
function ECStatus() {
    local cmd="describe-instance-status --instance-ids"
    local id="${1:-$EC_default}"
    ECDo "$cmd" "$id"
}
function ECGetDNS() {
    local id="${1:-$EC_default}"
    local running
    ECRunning "$id" 2>/dev/null || { log_error $id doesnt seem to be running; return 1; }
    aws ec2 describe-instances --instance-ids "$id" --query 'Reservations[].Instances[].PublicDnsName'
}


function ECDo() {
    local cmd="$1"
    local id="$2"
    aws ec2 $cmd "$id"
}

