FROM ros
RUN apt-get update && \
    apt-get install -y firefox && \
    apt-get install -y ros-melodic-turtlesim && \
    apt-get install -y ros-melodic-gazebo-ros-pkgs

