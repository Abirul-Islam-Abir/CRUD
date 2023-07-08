import 'dart:convert';

import 'package:rest_api/Rest%20Api/url_link.dart';
import 'package:http/http.dart' as http;

Future getProductData() async {
  final url = Uri.parse(readProductUrl);
  final response = await http.get(url, headers: header);

  final data = jsonDecode(response.body);

  if (response.statusCode == 200 && data['status'] == 'success') {
    return data['data'];
  } else {
    throw Exception();
  }
}
