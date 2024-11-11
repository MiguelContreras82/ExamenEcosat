import 'package:appflutter/entities/photos.dart';
import 'package:appflutter/pages/detalle.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/entities/note.dart';


class Loadingspinner  extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              semanticsLabel: 'Loading',
            ),
          ],
        ),
      );
  }
}