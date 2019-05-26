FROM ros
RUN apt-get update && apt-get install -y firefox
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash"

