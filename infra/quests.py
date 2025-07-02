from pydantic import BaseModel, ConfigDict, Field
from typing import Any, Self
from uuid import uuid4
from beet import Context, Predicate

from .infra import Announcement

SelfOpt = Self | None

EMPTY_FUNC = "hod:_empty"

def make(ctx: Context):
    # ctx.data["hod:test"] = Advancement()
    ...    

class QuestGoal(BaseModel):
    model_config = ConfigDict()
    
    description: str
    pre_check: str = Field(default=EMPTY_FUNC)
    to_complete: dict | None = Field(default=None, exclude=True) # Predicate
    to_fail: dict | None = Field(default=None, exclude=True) # Predicate
    time_to_complete: int | None = Field(default=None)
    
    id: str = Field(default_factory=lambda: str(uuid4()))
    
_quest_ids = set()

class Quest(BaseModel):
    id: str
    name: str
    description: str
    goals: list[QuestGoal]
    complete_goals: list[QuestGoal] = Field(default_factory=lambda: list())
    time_to_complete: int | None = Field(default=None)
    on_begin: str = Field(default=EMPTY_FUNC)
    on_complete: str = Field(default=EMPTY_FUNC)
    on_cancel: str = Field(default=EMPTY_FUNC)
    next: str | None = Field(default=None)
    
    complete: bool = Field(default=False)
    
    def model_post_init(self, context: Any):
        if self.id in _quest_ids:
            raise ValueError(f"Repeating quest ID {self.id}")

        _quest_ids.add(self.id)
    
    
class QuestLine(BaseModel):
    name: str
    description: str
    quest_ids: list[str]
    announce_receive: Announcement | None = Field(default=None)
    announce_complete: Announcement | None = Field(default=None)

def register_predicates(ctx: Context, q: Quest):
    for goal in q.goals:
        if goal.to_complete:
            ctx.data[f"{ctx.project_name}:{goal.id}_complete"] = Predicate(goal.to_complete)
        if goal.to_fail:
            ctx.data[f"{ctx.project_name}:{goal.id}_fail"] = Predicate(goal.to_fail)