import requests

def agregarMarca ():
    #{“id”:0,”description”:”Prueba <Tu nombre>”,”prefix”:”<PBA<tus iniciales>>”}
    jsonAEnviar = {'id':0,'description':'Prueba Miguel Contreras','prefix':'<PBA<MC>>'}
    r = requests.post('http://201.174.8.28:15507/api/devices/v1/mysql/brands/add', json=jsonAEnviar)
    print(r.status_code)    
agregarMarca()