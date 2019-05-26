#docker check images/container
docker image list
docker ps

#docker build/run/execute
docker build -t rosgui ros_docker_gui
docker exec -it rosgui bash

#set DISPLAY and run
set-variable -name DISPLAY -value 172.22.188.193:0.0
docker run --name rosgui -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix rosgui

# run firefox
usr/bin/firefox

#source ros
source /opt/ros/melodic/setup.bash 

# run turtlesim
rosrun turtlesim turtlesim_node

# run gazebo
gazebo

