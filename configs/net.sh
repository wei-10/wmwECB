mkdir ~/.config/clash
cd ~/.config/clash
wget https://img.makephoto.top/dependent/clash-linux-386-v1.18.0.gz
gzip -d clash-linux-386-v1.18.0.gz
mv clash-linux-386-v1.18.0 clash
chmod +x clash
wget https://img.makephoto.top/dependent/Country.mmdb
wget https://img.makephoto.top/dependent/config.yaml
wget https://img.makephoto.top/dependent/yacd.tar.xz
tar -xvf yacd.tar.xz
mv public dashboard
cd ~/.config/clash
#./clash -d ~/.config/clash
sudo mv ~/.config/clash/clash /usr/local/bin/
cat <<EOL >> ~/.zshrc

# 判断Clash进程是否在运行
if ! pgrep -x "clash" > /dev/null; then
    echo '代理服务未启动'
    # 如果没有运行，启动Clash
    nohup clash -d ~/.config/clash > ~/.config/clash.log 2>&1 &
    echo '代理服务启动成功'
fi

on() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    echo "HTTP/HTTPS Proxy on"
}

# 关闭代理函数
off() {
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo "HTTP/HTTPS Proxy off"
}
source ~/.zshrc

export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890

EOL
source ~/.zshrc
