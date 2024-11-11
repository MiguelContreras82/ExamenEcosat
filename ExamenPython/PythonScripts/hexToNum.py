def hexToNumber ():
    try:
        print("Digite el hexadecimal a convertir")
        hex = input()
        numero =  int(hex, 16)
        print(numero)
    except:
        print("Hex invalido")

    

hexToNumber()