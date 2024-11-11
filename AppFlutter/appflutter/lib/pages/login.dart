import 'package:appflutter/components/alertaCustom.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/components/inputTextC.dart';
import 'package:appflutter/pages/principal.dart';
import 'package:easy_loading_button/easy_loading_button.dart';

class Login extends StatefulWidget {
  const Login(
      {super.key, this.color = const Color.fromARGB(255, 202, 187, 69)});
  final Color color;
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  double _size = 1.0;
  bool constraseniaEscondida = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    OutlineInputBorder _border() {
      return OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: const BorderSide(color: Colors.white));
    }

    contraseniaVisible() {
      setState(() {
        constraseniaEscondida = !constraseniaEscondida;
      });
    }

    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 18, 82, 179),
              Color.fromARGB(66, 64, 165, 179)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 120.55,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      InputTextC().customTextInput(
                          "Usuario", usernameController, false, null),
                      SizedBox(
                        height: height * .01,
                      ),
                      InputTextC().customTextInput(
                          "Contraseña",
                          pswController,
                          constraseniaEscondida,
                          InkWell(
                            onTap: () => {contraseniaVisible()},
                            child: Icon(
                                constraseniaEscondida
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white),
                          )),
                      SizedBox(height: height * .01),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            if (validar()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const Principal();
                                  },
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .01),
                    ],
                  ),
                ),
              ),
            )));
  }

void snackBar (String mensaje) {
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
  bool validar() {
    if (usernameController.text == null || usernameController.text == '') {
    Alertacustom().snackBar("Usuario no puede estar vacío",context);     
      return false;
    }
    if (pswController.text == null || pswController.text == '') {
      Alertacustom().snackBar("Contraseña no puede estar vacío",context);        
      return false;
    }
    return true;
  }
}
