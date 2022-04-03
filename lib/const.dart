import 'package:flutter/material.dart';

var mediaQuery;
var h;
var w;

navigate(context, route) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => route));
}

navigateReplace(context, route) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => route));
}
