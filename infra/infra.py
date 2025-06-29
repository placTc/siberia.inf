from dataclasses import dataclass, field

@dataclass
class ItemStack:
    id: str = field(default="minecraft:stone")
    count: int = field(default=1)
    components: dict[str, dict | list] = field(default_factory=dict)
    
@dataclass
class Announcement:
    sound: str
    title: str
    subtitle: str
