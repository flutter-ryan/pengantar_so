import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pengantar_so/model/pasien.dart';

class PasienService {
  final _url = 'http://localhost:8000/api/pasien/500030';

  Future<Pasien> getPasien() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      return compute(pasienFromJson, response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
