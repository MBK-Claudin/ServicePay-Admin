import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter/cupertino.dart';

class ConnexionLaravel {
  final String _url = "http://10.0.2.2:8000/api/";

  inscription(info, laravelUrl) async {
    var urlcomplet = _url + laravelUrl;
    return await http.post(
      Uri.parse(urlcomplet),
      body: jsonEncode(info),
      headers: _headers(),
    );
  }


  _headers() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
