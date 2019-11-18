import 'package:pengantar_so/model/riwayat.dart';
import 'package:pengantar_so/services/base_url.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class RiwayatService {
  Future<List<Riwayat>> getRiwayat() async {
    try {
      final response = await http.get('$baseUrl/history');
      if (response.statusCode == 200) {
        return riwayatFromJson(response.body);
      }
      return Future.error("Connection error, please try again!");
    } catch (e) {
      return Future.error(
          "We are Sorry Server is busy right now,\nplease try again later!");
    }
  }
}
