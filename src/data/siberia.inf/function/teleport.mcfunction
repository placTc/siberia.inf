execute at @a[predicate=siberia.inf:teleportation_ready] as @p:
    if entity @n[tag=inf.teleport_active, distance=..0.5]:
        scoreboard objectives add siberia.announce dummy
        execute store result score @p siberia.announce run data get entity @n[tag=inf.teleport_active, distance=..0.5] data.tp.announce
        tag @n[tag=inf.teleport_active, distance=..0.5] remove inf.teleport_active
        function siberia.inf:tp_dimension with entity @n[tag=inf.teleport, distance=..0.5] data.tp
        schedule function siberia.inf:announce_teleport 5t append