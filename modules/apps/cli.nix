{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    fastfetch
    btop
    killall
    nvtopPackages.nvidia
    antigravity-cli
    systemctl-tui
    unzip
    zip
    tree
    wget
    curl
    speedtest-cli
    inetutils
    iproute2
    dnsutils
    micro
  ];
}
