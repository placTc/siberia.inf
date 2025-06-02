scoreboard objectives add siberia.announce dummy
scoreboard objectives add siberia.debug dummy
scoreboard objectives add siberia.pid dummy
scoreboard players add $total siberia.pid 0
function siberia.inf:infrastructure/pid/load
function siberia.inf:mechanics/bag_of_holding/root/load
