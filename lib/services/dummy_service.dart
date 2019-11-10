import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:pengantar_so/model/dummy.dart';

class DummyService {
  final _baseUrl = 'http://api_pengantar_so.test/api';

  Future<Dummy> getDummy(String nomor) async {
    final response = await http.get('$_baseUrl/dummy/$nomor');

    if (response.statusCode == 200) {
      return Future.delayed(Duration(seconds: 1)).then(
        (onValue) => dummyFromJson(response.body),
      );
    } else if (response.body.isEmpty) {
      return Future.error("Data not Found");
    } else {
      return Future.error("Connect error");
    }
  }
}
