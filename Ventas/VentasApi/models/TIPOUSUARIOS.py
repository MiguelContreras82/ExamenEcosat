from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric
from dbconf.db import Base

class TIPOUSUARIOS(Base):
    __tablename__ = "TipoUsuarios"
    IdTipoUsuario = Column(Integer,index = True, primary_key = True)
    Descripcion = Column(String(50))
