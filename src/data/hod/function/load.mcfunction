scoreboard objectives add hod.announce dummy
scoreboard objectives add hod.debug dummy
scoreboard objectives add hod.pid dummy
scoreboard objectives add hod.open_book minecraft.used:minecraft.written_book
scoreboard players add $total hod.pid 0
function hod:infrastructure/pid/load
function hod:mechanics/bag_of_holding/root/load
function hod:mechanics/quests/functions/load
