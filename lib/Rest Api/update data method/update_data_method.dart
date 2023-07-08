import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/Rest%20Api/url_link.dart';

Future updateProductData(
    {required imgUrl,
    required prdoductCode,
    required productName,
    required qty,
    required totlaPrice,
    required unitPrice,
    required id}) async {
  final uri = Uri.parse('$updateUrl$id');
  final body = {
    "_id": id,
    "Img": imgUrl,
    "ProductCode": prdoductCode,
    "ProductName": productName,
    "Qty": qty,
    "TotalPrice": totlaPrice,
    "UnitPrice": unitPrice,
  };
  final response =
      await http.post(uri, body: json.encode(body), headers: header);
  if (response.statusCode == 200) {}
}
