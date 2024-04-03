# QML Personal Project

By Long Fang Huang/Long Phuong Huynh

QT version: 5.12

Skeleton design:
![Design](https://github.deere.com/storage/user/30417/files/c3fc1f79-f3f2-469a-aff9-24814c61f4d3)
 
**Online QML compiler for quick previews:**
https://patrickelectric.work/qmlonline/

**When creating new project just choose:**

Build system qmake

Leave minimal required Qt version default option (should be Qt 5.12)

In Kit Seleciton choose Desktop

**To be able to use QMultiMedia module:**

sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5

**To be able to run MP4 files:**

wget http://ppa.launchpad.net/mc3man/gstffmpeg-keep/ubuntu/pool/main/g/gstreamer0.10-ffmpeg/gstreamer0.10-ffmpeg_0.10.13-5ubuntu1~vivid_amd64.deb && sudo dpkg -i gstreamer0.10-ffmpeg_0.10.13-5ubuntu1~vivid_amd64.deb

**To be able to make and run tests:**

sudo apt install qml-module-qttest

**In .pro file:**

add multimedia behind 'QT +=', i.e:

QT += quick multimedia


Then run qmake again.

----------------------------------------------------------------------------------
**Assets atribution:**

Alfredo Hernandez (flaticon.com)  - play.svg, backward.svg, forward.svg

kliwir art (flaticon.com)      - pause.svg

Dewi Sari (flaticon.com)	   - stop.svg

IYAHICON (flaticon.com)	- maximize.svg

uxwing.com                        - n-alphabet-round-circle-icon.svg
