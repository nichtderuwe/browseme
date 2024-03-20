#!/bin/bash

echo $PROCEED|grep -q ^0$ && echo skipping
echo $PROCEED|grep -q ^0$ && exit 0

test -e venv || (test -e /etc/myveenv && cp -aurv /etc/myveenv venv)
test -e venv || python3 -m venv venv ;
source venv/bin/activate
pip3 install pillow requests beautifulsoup4 pandas webdriver-manager selenium 2>&1|grep -v "already satis"


torpsw="TOR"${RANDOM}"CONTROL"${RANDOM}
tortok=$(docker run --rm -it alpine ash -c "apk add tor &>/dev/null; tor --hash-password $torpsw" 2>&1 |grep ":"|tail -n1)
echo "$torpsw">/tmp/torpsw

(echo FROM alpine;echo RUN apk add tor )|docker build . -f - -t toralpine

docker run  -d --name tor     toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {nz},{ad},{it},{va},{li},{lu},{be},{nl},{dk},{ch},{fr},{de},{at},{pl},{cz},{uk},{ie},{lt},{es},{hr} StrictNodes 1")|tor -f -'
docker run  -d --name torde   toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {de} StrictNodes 1")|tor -f -'
docker run  -d --name tordach toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {de},{at},{ch},{li} StrictNodes 1")|tor -f -'
docker run  -d --name torfor1 toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {ug},{tr},{ac},{ao},{al},{dz},{bs},{bh},{bd},{by},{bb},{bz},{bm},{bj},{ba},{bo},{bt},{br},{bw},{bv},{kh},{bi},{bn},{vg},{io},{cl},{cn},{cx},{td},{km},{co},{cc},{ci},{dj},{cy},{ee},{gq},{sv},{fj},{fo},{fk},{pf},{gf},{fx},{gr},{gm},{gi},{gh},{gp},{gd},{gl},{gw},{gn},{gt},{gu},{is},{ht},{hs},{gy},{il},{im},{jo},{jp},{jm},{ki},{kz},{ke},{ls},{lb},{kw},{kr},{kp},{mo},{mk},{mg},{mv},{mw},{my},{mq},{mu},{mm},{mz},{na},{nr},{rw},{rs},{py},{pr},{ph},{pn},{pe}{nz},{ma},{bz},{bh},{ai},{pr},{qa},{rs},{sl},{sc},{sg},{sk},{si},{gs},{so},{sb},{za},{kn},{kl},{sh},{sh},{sy},{sz},{sj},{tg},{to},{tt},{tm},{ae},{uy},{wf},{ye},{zm},{zw},{qa},{sm},{st} StrictNodes 1")|tor -f -'
docker run  -d --name torfor2 toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {ug},{tr},{ac},{ao},{al},{dz},{bs},{bh},{bd},{by},{bb},{bz},{bm},{bj},{ba},{bo},{bt},{br},{bw},{bv},{kh},{bi},{bn},{vg},{io},{cl},{cn},{cx},{td},{km},{co},{cc},{ci},{dj},{cy},{ee},{gq},{sv},{fj},{fo},{fk},{pf},{gf},{fx},{gr},{gm},{gi},{gh},{gp},{gd},{gl},{gw},{gn},{gt},{gu},{ht},{hs},{gy},{il},{im},{jo},{jp},{jm},{ki},{kz},{ke},{ls},{lb},{kw},{kr},{kp},{mo},{mk},{mg},{mv},{mw},{my},{mq},{mu},{mm},{mz},{na},{nr},{rw},{rs},{py},{pr},{ph},{pn},{pe}{nz},{ma},{bz},{bh},{ai},{pr},{qa},{rs},{sl},{sc},{sg},{sk},{si},{gs},{so},{sb},{za},{kn},{kl},{sh},{sh},{sy},{sz},{sj},{tg},{to},{tt},{tm},{ae},{uy},{wf},{ye},{zm},{zw},{qa},{sm},{st} StrictNodes 1")|tor -f -'
docker run  -d --name torfor3 toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {ug},{tr},{ac},{ao},{al},{dz},{bs},{bh},{bd},{by},{bb},{bz},{bm},{bj},{ba},{bo},{bt},{br},{bw},{bv},{kh},{bi},{bn},{vg},{io},{cl},{cn},{cx},{td},{km},{co},{cc},{ci},{dj},{cy},{ee},{gq},{sv},{fj},{fo},{fk},{pf},{gf},{fx},{gr},{gm},{gi},{gh},{gp},{gd},{gl},{gw},{gn},{gt},{gu},{ht},{hs},{gy},{il},{im},{jo},{jp},{jm},{ki},{kz},{ke},{ls},{lb},{kw},{kr},{kp},{mo},{mk},{mg},{mv},{mw},{my},{mq},{mu},{mm},{mz},{na},{nr},{rw},{rs},{py},{pr},{ph},{pn},{pe}{nz},{ma},{bz},{bh},{ai},{pr},{qa},{rs},{sl},{sc},{sg},{sk},{si},{gs},{so},{sb},{za},{kn},{kl},{sh},{sh},{sy},{sz},{sj},{tg},{to},{tt},{tm},{ae},{uy},{wf},{ye},{zm},{zw},{qa},{sm},{st} StrictNodes 1")|tor -f -'
docker run  -d --name torfor4 toralpine ash -c '(echo SocksPort 0.0.0.0:9050 ;echo ControlPort 127.0.0.1:9051; echo HashedControlPassword '"$tortok"';echo "ExitNodes {ug},{tr},{ac},{ao},{al},{dz},{bs},{bh},{bd},{by},{bb},{bz},{bm},{bj},{ba},{bo},{bt},{br},{bw},{bv},{kh},{bi},{bn},{vg},{io},{cl},{cn},{cx},{td},{km},{co},{cc},{ci},{dj},{cy},{ee},{gq},{sv},{fj},{fo},{fk},{pf},{gf},{fx},{gr},{gm},{gi},{gh},{gp},{gd},{gl},{gw},{gn},{gt},{gu},{is},{ht},{hs},{gy},{il},{im},{jo},{jp},{jm},{ki},{kz},{ke},{ls},{lb},{kw},{kr},{kp},{mo},{mk},{mg},{mv},{mw},{my},{mq},{mu},{mm},{mz},{na},{nr},{rw},{rs},{py},{pr},{ph},{pn},{pe}{nz},{ma},{bz},{bh},{ai},{pr},{qa},{rs},{sl},{sc},{sg},{sk},{si},{gs},{so},{sb},{za},{kn},{kl},{sh},{sh},{sy},{sz},{sj},{tg},{to},{tt},{tm},{ae},{uy},{wf},{ye},{zm},{zw},{qa},{sm},{st} StrictNodes 1")|tor -f -'
#docker stop selenium;docker rm selenium;
#docker run --rm -d -p 4444:4444 -p 5900:5900 -e LANGUAGE=$((echo de_AT.UTF-8;echo de_BE.UTF-8;echo de_CH.UTF-8;echo de_DE.UTF-8;echo de_LI.UTF-8;echo de_LU.UTF-8;)|shuf|head -n1) -e ENABLE_VNC=true --shm-size="2g" --name selenium selenium/standalone-chrome;sleep 10
#docker run --rm -d -p 4444:4444 -p 5900:5900 -e LANGUAGE=$((echo de_AT.UTF-8;echo de_BE.UTF-8;echo de_CH.UTF-8;echo de_DE.UTF-8;echo de_LI.UTF-8;echo de_LU.UTF-8;)|shuf|head -n1) -e ENABLE_VNC=true --shm-size="2g" --name selenium ghcr.io/nichtderuwe/mycron:seleniumchrome;sleep 10


sleep 8
docker ps |cut -d'"' -f1-3

startdir=$(pwd)
test -e public || mkdir public
echo "nothing here"   > public/index.html

test -e actions || (
[[ -z "$BASEKEY" ]] || ( 
    touch /tmp/id_rsa
    chmod 0600 /tmp/id_rsa;
    echo "$BASEKEY"|base64 -d >/tmp/id_rsa;
    pwd ; ls -lh1 )
test -e actionsrepo && ( 
    which git || ( apt-get update  && apt-get -y install git )
    test -e actions && (
        test -e actions/.git && (cd actions ;git pull)
        )
     #ssh-keyscan github.com >> /tmp/known_hosts
     #ssh-keyscan gitlab.com >> /tmp/known_hosts
    test -e actions || (
        git config --global core.sshCommand "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null -i /tmp/id_rsa"
        git clone $(cat actionsrepo) actions
        )
    )
)
test -e actions || echo "ACTIONS MISSING"
test -e actions || exit 1

(cd actions;
for file in $(ls -1 |grep "\.sh$");do  
echo "running $file"
    time bash "$file" $startdir/public;done

)
docker stats --no-stream --no-trunc

#
#docker stop $(docker ps --format {{.Names}} )  &>/dev/null 
#
#docker rm selenium    &>/dev/null 

#for cont in $(docker ps --format '{{.Names}}');do
#(docker  stop $cont  &>/dev/null  ;docker rm $cont  &>/dev/null ) &
#done
#wait
echo done
exit 0
