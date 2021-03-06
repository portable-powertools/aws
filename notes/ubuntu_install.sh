# basic ros install
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-ros-base

sudo rosdep init
sudo rosdep update
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install --upgrade python-pip
sudo apt-get install python-catkin-tools
