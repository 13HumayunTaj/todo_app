import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/Screens/HomeScreen.dart';

AddTodoFunction(String title, String description) async {
  final url = 'https://api.nstack.in/v1/todos';
  final uri = Uri.parse(url);
  final body = {
    "title": title,
    "description": description,
    "is_completed": false,
  };

  final response = await http.post(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 201) {
    Get.offAll(
      () => HomeScreen(),
    );
    Get.snackbar(
      'Success',
      'Todo is added successfully!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  } else {
    Get.snackbar(
      'Error ${response.statusCode}',
      'Could not Add Todo',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
