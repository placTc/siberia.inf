from bolt_expressions import Scoreboard

def debug_say(txt):
    debug_mode = Scoreboard.objective("siberia.debug")
    if debug_mode["@p"]:
        tellraw @p [{text:"Debug >>> ",italic:true,color:"gray"},{text: txt, italic: false, color: "white"}]
    