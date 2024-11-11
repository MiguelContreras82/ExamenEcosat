from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric,SMALLINT
from dbconf.db import Base



class VENTAS (Base):
    __tablename__ = "Ventas"
    IdVenta = Column(Integer,index = True, primary_key = True)
    IdUsuario = Column(Integer)
    ImporteTotal = Column(Float)
    Fecha = Column(DATETIME)
    CantidadProductos = Column(Integer)
    EstatusEliminar = Column(SMALLINT)


