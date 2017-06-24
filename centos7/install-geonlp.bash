#!/bin/bash
sudo yum install -y boost-devel sqlite3-devel
sudo yum --enablerepo=epel install gdal-devel -y

wget https://geonlp.ex.nii.ac.jp/software/geonlp-1.2.0.tgz

