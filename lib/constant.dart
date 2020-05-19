import 'package:flutter/material.dart';
const ktextFieldDecoration= InputDecoration(
  hintText: "",
  hintStyle: TextStyle(
      color: Colors.blueAccent
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),bottomLeft: Radius.circular(24.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);