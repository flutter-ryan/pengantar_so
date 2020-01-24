import 'package:pengantar_so/model/urgensi.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:pengantar_so/services/base_url.dart';

class UrgensiService {
  Future<List<Urgensi>> getUrgensi() async {
    try {
      final response = await http.get('$baseUrl/urgensi');
      if (response.statusCode == 200) {
        return urgensiFromJson(response.body);
      }

      return Future.error("Connection error, please try again!");
    } catch (e) {
      return Future.error(
          "We are Sorry Server is busy right now,\nplease try again later!");
    }
  }
}
