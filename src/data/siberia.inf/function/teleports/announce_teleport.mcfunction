from bolt_expressions import Scoreboard

announcement = Scoreboard.objective("siberia.announce")
title @p clear
if announcement["@p"] == 1:
    title @p subtitle {"text":"A space between worlds","italic":true}
    title @p title {"text":"<< The Interworld >>","underlined":true,"color":"dark_aqua"}
elif announcement["@p"] == 2:
    title @p title {text: "The Overworld"}