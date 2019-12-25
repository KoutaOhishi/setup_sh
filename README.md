# Setup Files for Ubuntu16.04  

## How to use  
$ git clone https://github.com/KoutaOhishi/setup_sh.git  
$ cd setup_sh  
$ chmod 755 *  
$ ./**file_name**  

## OpenCVについて  
 opencv3.4をインストールしたのにバージョンが上がってない場合は、以下のコマンドを実行してください。（一応cv2.soのバックアップをしておくこと）  
$ sudo rm /opt/ros/kinetic/lib/python2.7/dist-packages/cv2.so  
$ sudo cp /home/**username**/opencv/build/lib/cv2.so /opt/ros/kinetic/lib/python2.7/dist-packages/  

## Ubuntuのキーボード設定をMacBookAir用に変える方法
https://qiita.com/koreyou/items/341e1fac95c72d9743ad  
