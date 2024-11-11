from operator import index
from sqlalchemy import Column, Integer, String,DATETIME,Float ,Numeric
from dbconf.db import Base

class SUBVENTA (Base):
    __tablename__ = "SubVenta"
    IdSubVenta = Column(Integer,index = True, primary_key = True)
    IdVenta = Column(Integer)
    IdProducto = Column(Integer)
    Cantidad = Column(Integer)
    Import = Column(Integer)
    
