import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Screens/HomeScreen.dart';

DeleteTodoFunction(id) async {
  final url = 'https://api.nstack.in/v1/todos/$id';
  final uri = Uri.parse(url);
  final response = await http.delete(uri);
  print(
    'delete response = ' + response.statusCode.toString(),
  );
  if (response.statusCode == 200) {
    Get.offAll(
      () => HomeScreen(),
    );
    Get.snackbar(
      'Deleted',
      'Todo is deleted',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  } else {
    Get.snackbar(
      'Error ${response.statusCode}',
      'Could not delete Todo',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
