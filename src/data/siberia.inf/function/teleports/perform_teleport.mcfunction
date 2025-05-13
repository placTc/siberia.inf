from ../utils/debug_say import debug_say

macro perform_teleport:
    execute:
        execute store result score @p siberia.announce run data get entity @n[tag=inf.teleport, distance=..0.5] data.tp.announce
        function siberia.inf:tp_dimension with entity @n[tag=inf.teleport, distance=..0.5] data.tp
        schedule function siberia.inf:announcements/announce 5t append

execute at @a[predicate=siberia.inf:teleportation_ready] as @p:
    if entity @n[tag=inf.teleport_active, distance=..0.5]:
        debug_say("Teleport ready")
        tag @n[tag=inf.teleport_active, distance=..0.5] remove inf.teleport_active
        perform_teleport
    if entity @n[tag=inf.permanent_teleport, distance=..0.5]:
        debug_say("Teleport ready")
        perform_teleport