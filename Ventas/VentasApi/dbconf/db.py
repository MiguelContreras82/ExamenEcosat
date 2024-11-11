from sqlalchemy import create_engine
import urllib
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker



Base = declarative_base()
DATABASE_MYSQL = 'mssql+pymssql://usuario:contraseña@direccionbase/Ventas'
enginemysql = create_engine(DATABASE_MYSQL)
sessionSqlS = sessionmaker(autocommit=False,autoflush=False,bind=enginemysql)