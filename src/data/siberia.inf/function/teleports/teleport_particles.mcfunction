execute at @e[tag=inf.teleport_active]:
    particle electric_spark ~ ~1 ~ 0.235 1 0.235 0.01 5 normal
    particle dust_color_transition{from_color:[0.38,0.21,0.51],to_color:[0.15,0.64,0.41],scale:1} ~ ~1.25 ~ 0.1 1 0.1 0.01 5 normal

execute at @e[tag=inf.teleport]:
    particle dust{color:[0.0,0.19,0.12],scale:1} ~ ~ ~ 0.25 0.25 0.25 0.001 2 normal

execute at @e[tag=inf.permanent_teleport]:
    particle happy_villager ~ ~1 ~ 0.235 1 0.235 0.01 1 normal
    particle dust_color_transition{from_color:[0.38,0.21,0.51],to_color:[0.15,0.64,0.41],scale:1} ~ ~1.25 ~ 0.1 1 0.1 0.01 5 normal