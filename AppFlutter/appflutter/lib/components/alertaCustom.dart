import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class Alertacustom {
 void alerta (BuildContext context) {
   showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          icon: Icon(Icons.warning,size: 40.00 , color: Colors.redAccent,),
          title: const Text('Se a producido un error al conectar con el servidor'),      
          content: const Text("De 'click' en el boton refresh para recargar."),    
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Entendido'),
            ),
          
          ],
        ),
      );
 }

void snackBar (String mensaje, BuildContext context) {
  var snackBar = SnackBar(
        backgroundColor: const Color.fromARGB(255, 83, 15, 15),
        content:  Text(mensaje),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}