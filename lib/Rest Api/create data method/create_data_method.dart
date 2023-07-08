import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/Rest%20Api/url_link.dart';

Future createProduct({required formValue}) async {
  const url = createProductUrl;
  final uri = Uri.parse(url);
  final body = jsonEncode(formValue);
  final response = await http.post(uri, body: body, headers: header);
  if (response.statusCode == 200) {}
  final decodedResponse = jsonDecode(response.body);
  return decodedResponse;
}
