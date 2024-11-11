from dbconf.db import sessionSqlS  #,  SessionLocal,engine, SessionLocalSqlSrvParser, enginesqlsrv, SessionLocalSqlSrvErp


def mysqlDb():
    try:
        db =  sessionSqlS()
        yield db
    finally:
        db.close