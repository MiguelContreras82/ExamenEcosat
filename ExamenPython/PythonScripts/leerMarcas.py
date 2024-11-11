import requests


def leerMarcas ():
    r = requests.post('http://201.174.8.28:17505/api/devices/v1/mysql/brands', json={"id": 0})
    print(r.json())
        
leerMarcas()