#!/bin/bash
sudo yum install -y vim wget unzip java-1.8.0-openjdk-devel

wget https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
tar zxvf spark-2.2.0-bin-hadoop2.7.tgz
sudo mv spark-2.2.0-bin-hadoop2.7 /opt/.

( 
	cd /opt
	sudo ln -s spark-2.2.0-bin-hadoop2.7 spark
)
 
# Kuromoji形態素解析器のインストール
wget https://github.com/downloads/atilika/kuromoji/kuromoji-0.7.7.zip
unzip kuromoji-0.7.7.zip
(
	cd kuromoji-0.7.7/lib
	sudo mv kuromoji-0.7.7.jar /opt/spark/lib/.
)
# 一時ファイルの削除
rm spark-2.2.0-bin-hadoop2.7.tgz
rm -r kuromoji-0.7.7

# spark
echo "export SPARK_HOME=/opt/spark" >> ~/.bash_profile
echo "PATH=$PATH:$HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin"
echo "export PATH" >> ~/.bash_profile
