import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final url = 'https://624986bd852fe6ebf87c51d3.mockapi.io/dubai/users';

  http.Response response;
  Future getData() async {
    try {
      response = await http.get(url);
    } catch (e) {
      print('Error $e');
    }

    return response;
  }

  Future post({String name, String userEmail}) async {
    try {
      response = await http.post(
        url,
        body: json.encode(
          {
            'name': '$name',
            'userEmail': '$userEmail',
          },
        ),
      );
    } catch (e) {
      print('Error $e');
    }

    return response;
  }
}
