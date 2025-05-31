scoreboard objectives add siberia.announce dummy
scoreboard objectives add siberia.debug dummy
scoreboard objectives add siberia.pid dummy
scoreboard players add $total siberia.pid 0
function siberia.inf:infrastructure/pid/load
scoreboard objectives add siberia.bag_of_holding_open dummy
scoreboard players add @a siberia.bag_of_holding_open 0