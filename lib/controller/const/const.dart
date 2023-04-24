import 'package:flutter/material.dart';

// Navigate To Next Page
nextpage(context, path) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => path)));
}

// Navigate To Back Page
backpage(context) {
  Navigator.pop(context);
}

// Colors

var appBlack = const Color(0xFF050505);
var appWhite = const Color(0xFFFFFFFF);
var appDanger = Colors.red;

// API Keys and Values

const mainHost = "https://binance43.p.rapidapi.com";
const rapidKey = "b5867ef153msh0e49160c567e6fbp1fc903jsn2495ca73e5eb";
const rapidHost = "binance43.p.rapidapi.com";
