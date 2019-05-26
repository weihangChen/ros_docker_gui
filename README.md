# ros_docker_gui
We are working with Ros + Gazebo and we really want to ship a developer docker image with 
- GUI support – showing Gazebo on windows 
- remote python/C++ debugging configuration 

So, the new developer or master students can easily start working on the algorithm instead of troubling with install and configure Ubuntu. This blog post is about docker and GUI signal forwarding from docker container (ubuntu) to windows. I make a video demonstrating a few user cases.

1. Start Xming and start docker
2. Download a git project that contains the dockerfiles needed
3. Start firefox in docker container and it shows on windows
4. Start roscore and run turtlesim and turtlesim GUI shows on windows
5. Start gazebo and the simulation environment shows on windows

For in-depth understanding, please read content below, As shown in this [video](https://www.youtube.com/watch?v=Jp58Osb1uFo&feature=youtu.be), x Window server is the interface transmitting signals between graphic card and GUI applications that run within an OS.



The signals can be transmitted to local X client based on a protocol and they can also be transmitted to remote X client based on another protocol.  The detail instruction of making this work is in this [post](https://blogs.msdn.microsoft.com/jamiedalton/2018/05/17/windows-10-docker-gui/). First you need to install Xming and start it, so windows has X client that listens to the incoming signals. Of course, the signals need some instructions, so they know where to go as well, and it is done through setting the DISPLAY variable. Almost 100% of blog posts out there starts the GUI application as the last line of command in the Dockerfile.

```
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y firefox
CMD /usr/bin/firefox
```

It really gives me the feeling that the signal forwarding to remote X client is opened as a session for one specific GUI application, but that is not true. The communication channel exists as long as the docker container lives. Watch the video and you know what I mean here.
