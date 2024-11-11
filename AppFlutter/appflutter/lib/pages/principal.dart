import 'dart:convert';
import 'package:appflutter/components/alertaCustom.dart';
import 'package:appflutter/components/inputTextSearchP.dart';
import 'package:appflutter/components/loadingSpinner.dart';
import 'package:appflutter/entities/photos.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appflutter/components/listP.dart';
import 'package:appflutter/entities/note.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});
  State<Principal> createState() => _Principal();
}

class _Principal extends State<Principal> {
  @override
  void initState() {
    fetchPhotos();
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();
  List<Photos> _photos = [];
  List<Photos> _allRecords = [];
  bool _banderaCargando = true;
  fetchPhotos() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/photos';
      var response = await http.get(Uri.parse(url));
      setState(() {
        _banderaCargando = false;
      });
      List<Photos> photos = [];
      if (response.statusCode == 200) {
        var jsonn = json.decode(response.body);
        for (var i in jsonn) {
          photos.add(PhotosFromJson(json.encode(i)));
        }
      } else {
        Alertacustom().alerta(context);
      }
      setState(() {
        _photos = photos;
        _allRecords = photos;
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _banderaCargando = false;
      });
      Alertacustom().alerta(context);
    }
  }

  filtrar() {
    List<Photos> listaTemp = _allRecords
        .where((el) => el.title.contains(_searchController.text))
        .toList();
    setState(() {
      _photos = listaTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    /*  if (_banderaCargando) {
      return Loadingspinner();
    }*/

    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Card(
                color: const Color.fromARGB(255, 52, 126, 238),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Inicio',
                            style: TextStyle(color: Colors.white),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _banderaCargando = true;
                                  });

                                  fetchPhotos();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: InputTextSearchP().customTextInput(
                              _searchController,
                              (text) => {filtrar()},
                              () => {
                                    _searchController.clear(),
                                    setState(() {
                                      _photos = _allRecords;
                                    })
                                  }),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              _banderaCargando
                  ? Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Loadingspinner(),
                          ]),
                    )
                  : SizedBox(
                      height: height * .80,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListP(height, _photos[index]);
                        },
                        itemCount: _photos.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
