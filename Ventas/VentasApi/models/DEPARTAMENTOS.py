from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric
from dbconf.db import Base


class DEPARTAMENTOS (Base):
    __tablename__ = "Departamentos"
    IdDepartamento = Column(Integer,index = True, primary_key = True)
    Descripcion = Column(String(150))

    
