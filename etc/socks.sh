american() {
  networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 9999 off
  networksetup -setsocksfirewallproxy Airport 127.0.0.1 9999 off
  ssh -CD 9999 disco
  networksetup -setsocksfirewallproxystate Ethernet off
  networksetup -setsocksfirewallproxystate Airport off
}

canadian() {
  networksetup -setsocksfirewallproxystate Ethernet off
  networksetup -setsocksfirewallproxystate Airport off
}