import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/Rest%20Api/url_link.dart';
import 'package:rest_api/Utils/toast_method.dart';

Future createDataProduct(context,
    {required name,
    required code,
    required img,
    required qty,
    required price}) async {
  const url = createProductUrl;
  final uri = Uri.parse(url);
  final body = jsonEncode({
    "ProductName": name,
    "ProductCode": code,
    "Img": img,
    "Qty": qty,
    "UnitPrice": price,
    "TotalPrice": price,
  });
  final response = await http.post(uri, body: body, headers: header);
  if (response.statusCode == 200) {
    displaySuccessMotionToast(context, desc: 'Product Created Successfully');
  }
  final decodedResponse = jsonDecode(response.body);
  return decodedResponse;
}
