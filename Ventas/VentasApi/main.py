from fastapi import FastAPI, Form, Response
from fastapi.middleware.cors import CORSMiddleware
import cv2
from fastapi.responses import StreamingResponse, FileResponse
from sqlalchemy.orm import Session
import dbconf.session as sessiones
from fastapi.params import Depends
from sqlalchemy import extract  
from os import walk
import base64
from fastapi.responses import PlainTextResponse
from fastapi import Request, FastAPI
from models import * 
from pydantic import BaseModel
from typing import Any, Dict, AnyStr, List, Union
import datetime
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

JSONObject = Dict[AnyStr, Any]
JSONArray = List[Any]
JSONStructure = Union[JSONArray, JSONObject]


@app.post('/login')
def login(arbitrary_json: JSONStructure = None , db:Session = Depends(sessiones.mysqlDb)):
    usuario =  db.query(USUARIOS.USUARIOS).filter(USUARIOS.USUARIOS.Usuario == arbitrary_json["usuario"]).first()
    if usuario == None:
        return {'estatus': False, 'message' : "Usuario y/o contraseña incorrecto"}
    else:
        if usuario.Contrasena ==  arbitrary_json["contrasenia"]:
            return {'estatus': True, 'message' : "Exitoso", 'idUsuario': usuario.IdUsuario}
        else:
            return {'estatus': False, 'message' : "Usuario y/o contraseña incorrecto"}


    

@app.post('/generar-venta')
def generarVenta (arbitrary_json: JSONStructure = None,db:Session = Depends(sessiones.mysqlDb)): 
    total = 0
    cantidadProd = 0
    for  el in arbitrary_json['venta'] :
        cantidadProd += el['cantidad']
        total +=  el['precioIn'] * el['cantidad']
                    
    nuevaVenta =  VENTAS.VENTAS()
    nuevaVenta.IdUsuario = arbitrary_json["usuarioId"]    
    nuevaVenta.ImporteTotal =total
    nuevaVenta.Fecha = datetime.datetime.now()
    nuevaVenta.CantidadProductos = cantidadProd
    nuevaVenta.EstatusEliminar = 0    
    db.add(nuevaVenta)    
    db.commit()            
    print(nuevaVenta.IdVenta)
    for  el in arbitrary_json['venta'] :
        nuevaSubVenta = SUBVENTA.SUBVENTA()
        nuevaSubVenta.IdProducto =  el['prod']
        nuevaSubVenta.IdVenta = nuevaVenta.IdVenta
        nuevaSubVenta.Cantidad = el['cantidad']
        nuevaSubVenta.Import = el['precioIn']
        db.add(nuevaSubVenta)
        db.commit()
    return {'estatus' : True, 'message' :"Datos guardados correctamente" }


@app.get('/get-ventas')
def getVentas (db:Session = Depends(sessiones.mysqlDb)):
    ventas = db.query(VENTAS.VENTAS).all()
    ventasAEnviar =[]
    for  venta in ventas:
        jsonVenta = {}
        jsonVenta["fecha"] =   "" if venta.Fecha == None  else  venta.Fecha.strftime('%Y-%m-%d %H:%M:%S')
        jsonVenta["importe"] = format(venta.ImporteTotal, ".2f")  
        jsonVenta["usuario"] = ""
        if venta.IdUsuario != None:
            jsonVenta["usuario"] = db.query(USUARIOS.USUARIOS).filter(USUARIOS.USUARIOS.IdUsuario == venta.IdUsuario).first().Nombre
        jsonVenta["cantidadProd"] = venta.CantidadProductos
        ventasAEnviar.append(jsonVenta)
    return {'estatus' : True, 'message' :"Exitosa",'data': ventasAEnviar}


@app.get('/get-productos')
def getProductos(db:Session = Depends(sessiones.mysqlDb)):
    prod = db.query(PRODUCTOS.PRODUCTOS).all()
    jsonAEnviar = []
    for el in prod:
        jsCompose = {}
        jsCompose['id'] = el.IdProducto
        jsCompose['departamento'] = (db.query(DEPARTAMENTOS.DEPARTAMENTOS).filter(DEPARTAMENTOS.DEPARTAMENTOS.IdDepartamento == el.IdDepartamento) .first().Descripcion)
        jsCompose['descripcion'] = el.Descripcion
        jsCompose['precio'] = el.Precio
        jsonAEnviar.append(jsCompose)
    return {'estatus' : True, 'message' :"Exitosa",'data': jsonAEnviar}




