import 'dart:convert';
import 'package:appflutter/entities/photos.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appflutter/components/listP.dart';
import 'package:appflutter/entities/note.dart';

class Detalle extends StatefulWidget {
  const Detalle({super.key});
  State<Detalle> createState() => _Detalle();
}

class _Detalle extends State<Detalle> {
  @override
  void initState() {
    super.initState();
  }

  Photos? detallePhoto;
  bool _banderaCargando = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final detailPhoto = ModalRoute.of(context)!.settings.arguments as Photos;
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Detalle'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * .03,
              ),
              Icon(
                color: Colors.indigoAccent,
                Icons.rectangle,
                size: 60.4,
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Titulo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Text("Url",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child:
                          Text(detailPhoto.title, textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Center(
                    child: Text(detailPhoto.url, textAlign: TextAlign.center),
                  ))
                ],
              )
            ],
          ),
        )),
      ),
    ));
  }
}
