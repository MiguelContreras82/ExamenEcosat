from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric
from dbconf.db import Base


class PRODUCTOS (Base) :
    __tablename__ = "Productos"
    IdProducto =  Column(Integer,index = True, primary_key = True)
    IdDepartamento = Column(Integer)
    Descripcion = Column(String(150))
    Precio = Column(Float)

