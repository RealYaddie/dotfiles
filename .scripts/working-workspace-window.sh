#! /bin/bash
(firefox &) & sleep 5 &&
    sh -c "wmctrl -i -r `wmctrl -l | grep Firefox` -t 2"
