import 'dart:convert';

import 'package:rest_api/Rest%20Api/url_link.dart';
import 'package:http/http.dart' as http;

Future fetchDataProduct() async {
  var url = readProductUrl;
  var uri = Uri.parse(url);
  var response = await http.get(uri, headers: header);

  var responseBody = jsonDecode(response.body);

  if (response.statusCode == 200 && responseBody['status'] == 'success') {
    return responseBody['data'];
  }  return [];
}
