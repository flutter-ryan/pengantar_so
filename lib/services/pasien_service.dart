import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pengantar_so/model/pasien.dart';
import 'package:pengantar_so/services/base_url.dart';

class PasienService {
  Future<Pasien> getPasien(String norm) async {
    try {
      final response = await http.get('$baseUrl/pasien/$norm');
      if (response.statusCode == 200) {
        return pasienFromJson(response.body);
      } else {
        return Future.error("Connection error, please try again!");
        //throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(
          "We are Sorry Server is busy right now,\nplease try again later!");
    }
  }
}
