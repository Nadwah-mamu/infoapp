import 'dart:convert';

import 'package:http/http.dart';

Future<dynamic> getEmpDetails() async {
  try {
    final url = 'https://dummy.restapiexample.com/api/v1/employees';
    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      final body = jsonDecode(response.body);
      if (body["data"][0].isNotEmpty) {
        return body;
      }
    }
  } catch (e) {
    print("error is $e");
  }
}
