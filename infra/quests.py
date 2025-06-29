from pydantic import BaseModel, ConfigDict, Field, field_serializer, model_validator, model_serializer
from typing import Any, Self
from uuid import uuid4
from beet import Advancement, Context, Predicate
from bolt_expressions import Data

from .infra import Announcement, ItemStack

SelfOpt = Self | None

def make(ctx: Context):
    # ctx.data["hod:test"] = Advancement()
    ...    

class QuestGoal(BaseModel):
    model_config = ConfigDict()
    
    description: str
    to_complete: dict | None = Field(default=None, exclude=True) # Predicate
    to_fail: dict | None = Field(default=None, exclude=True) # Predicate
    time_to_complete: int | None = Field(default=None)
    keep_in_questbook: bool = Field(default=False)
    # next: SelfOpt = Field(default=None)
    
    complete: bool = Field(default=False)
    failed: bool = Field(default=False)
    
    id: str = Field(default_factory=lambda: str(uuid4()))
    
_quest_ids = set()

class Quest(BaseModel):
    
    id: str
    name: str
    description: str
    individual: bool
    standalone: bool
    goals: list[QuestGoal]
    time_to_complete: int | None = Field(default=None)
    on_begin: str | None = Field(default=None)
    on_complete: str | None = Field(default=None)
    on_cancel: str | None = Field(default=None)
    next: SelfOpt = Field(default=None)
    
    complete: bool = Field(default=False)
    
    def model_post_init(self, context: Any):
        if self.id in _quest_ids:
            raise ValueError(f"Repeating quest ID {self.id}")

        _quest_ids.add(self.id)
    
    @model_validator(mode='after')
    def validate_individual(self):
        if self.individual and not self.standalone:
            raise ValueError("Quest can't be both individual and part of a questline.")
        
        return self
    
    
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