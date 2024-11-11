
from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric
from dbconf.db import Base


class USUARIOS(Base):
    __tablename__ = "Usuarios"
    IdUsuario = Column(Integer,index = True, primary_key = True)
    IdTipoUsuario = Column(Integer)
    Nombre = Column (String)
    Usuario = Column (String)   
    Contrasena = Column(String)
