import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InputTextSearchP {
  Widget customTextInput(TextEditingController controller, Function onChanged,
      VoidCallback? tapCallBack) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      onChanged: (text) {
        onChanged(text);
      },
      decoration: InputDecoration(
        labelText: "Buscar",
                
        labelStyle: TextStyle(color: Colors.white) ,
        prefixIcon: Icon(Icons.search,color: Colors.white,),
        suffixIcon: InkWell(
          onTap: tapCallBack,
          child: Icon(Icons.clear,color: Colors.white),
        ),
         enabledBorder: _border(),
          focusedBorder: _border()),
        
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        borderSide: const BorderSide(color: Colors.white));
  }
}
