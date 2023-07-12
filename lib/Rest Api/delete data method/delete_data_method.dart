import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/Rest%20Api/url_link.dart';

Future<dynamic> deleteDataProduct(context, {required id}) async {
  final uri = Uri.parse('$deleteUrl$id');
  final response = await http.get(uri, headers: header);
  final decodedResponse = json.decode(response.body);
  if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
    var data = decodedResponse['data'];
    if (data['acknowledged'] == true && data['deletedCount'] == 1) {
      return true;
    } else {
      return false;
    }
  }
}
