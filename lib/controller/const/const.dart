import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// Navigate To Next Page
nextpage(context, path) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => path)));
}

// Navigate To Back Page
backpage(context) {
  Navigator.pop(context);
}

// Colors

var colorBlack = const Color(0xFF050505);
var colorWhite = const Color(0xFFFFFFFF);
var colorDanger = Colors.red;
var colorGreen = Colors.green;
var colorTransparent = Colors.transparent;

// API Keys and Values
const mainHost = "https://api.coingecko.com/api/v3";

// local Storage

var db = Hive.box('data');
