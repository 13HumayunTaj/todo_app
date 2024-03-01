import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchDataFunction() async {
  final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  print(response.statusCode);
  print(response.body);
  final json = jsonDecode(response.body);
  print(json);
  List items = json['items'] as List;
  print(items);
  return items;
}
