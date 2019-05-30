#!/usr/bin/python3
"""This is the state class"""
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from os import getenv
from models.city import City
import models


class State(BaseModel, Base):
    """This is the class for State
    Attributes:
        name: input name
    """
    __tablename__ = 'states'
    name = Column(String(128), nullable=False)
    cities = relationship(
        'City',
        backref='cities',
        cascade='all, delete',
        order_by="City.name"
    )

    if getenv('HBNB_TYPE_STORAGE') != 'db':
        @property
        def cities(self):
            obj = models.storage.all(City)
            ls = [v for k, v in obj.items() if v.state_id == self.id]
            sorted(ls, key=lambda city: city.name)
            return ls
