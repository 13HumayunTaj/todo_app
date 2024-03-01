import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Screens/HomeScreen.dart';

EditTodoFunction(id, String title, String description) async {
  final url = 'https://api.nstack.in/v1/todos/$id';
  final uri = Uri.parse(url);
  final body = {
    "title": title,
    "description": description,
    "is_completed": false,
  };
  final response = await http.put(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  print(
    'Edit response = ' + response.statusCode.toString(),
  );
  if (response.statusCode == 200) {
    Get.offAll(
      () => HomeScreen(),
    );
    Get.snackbar(
      'Edited',
      'Todo is Edited',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  } else {
    Get.snackbar(
      'Error ${response.statusCode}',
      'Could not edit Todo',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
