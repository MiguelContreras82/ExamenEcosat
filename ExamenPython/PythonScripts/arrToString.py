def arrToString ():
    elN =  int(input("Ingrese el numero de elementos: ")) 
    stringArr = []
    for el in range(0,elN) :
        print("Digite la cadena a ingresar: ")
        stringC = input() 
        stringArr .append(stringC)    
    print( ','.join(stringArr)) 
    
arrToString()
                  