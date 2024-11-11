import 'package:appflutter/entities/photos.dart';
import 'package:appflutter/pages/detalle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/entities/note.dart';

class ListP extends StatelessWidget {
  double height;
  Photos index;
  ListP(this.height, this.index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .12,
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return const Detalle();
                  },
                  settings: RouteSettings(
                    arguments: index,
                  )),
            );
          },
          child: Card(
            color: const Color.fromARGB(255, 202, 201, 201),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text(index.title),
                ),
              ],
            ),
          )),
    );
  }
}
