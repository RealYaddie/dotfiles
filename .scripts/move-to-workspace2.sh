#! /bin/bash
# Starting the script and waiting for 5 seconds
(xfce4-taskmanager &) & sleep 5 &&
# wmctrl -l shows the windows being managed by the WM and when the above
# script runs it changes st's title to htop so that is passed to wmctrl -r
# as the name of the window for action
# Note: have to wrap "htop" in quotes so it isn't interpreted as a command.
    sh -c "sleep 5; wmctrl -i -r `wmctrl -l | grep "Task Manager"` -t 1; \
          sleep 1; \
          wmctrl -i -r `wmctrl -l | grep "Task Manager"` -e 0,0,0,1366,587"
