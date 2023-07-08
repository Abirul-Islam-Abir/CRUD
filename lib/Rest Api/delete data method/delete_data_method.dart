import 'package:http/http.dart' as http;
import 'package:rest_api/Rest%20Api/url_link.dart';

Future deleteProductData({required id}) async {
  final uri = Uri.parse('$deleteUrl$id');
  final body = {"_id": id};
  final response = await http.get(uri, headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print('success');
  } else {
    print('fail');
  }
}
