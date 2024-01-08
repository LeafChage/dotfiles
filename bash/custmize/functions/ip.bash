function publicip() {
    curl -s 'https://api.ipify.org?format=json' | jq -r .ip
}
function privateip() {
    ip addr | grep -e "inet " | cut -d' ' -f 2
}
alias localip="privateip"
