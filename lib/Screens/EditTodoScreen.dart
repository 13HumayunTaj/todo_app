import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Services/EditTodoFunction.dart';

import '../Services/AddTodoFunction.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({super.key});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  //
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Todo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: titleController..text = Get.arguments['title'],
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: descController
                    ..text = Get.arguments['description'],
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    EditTodoFunction(
                      Get.arguments['id'],
                      titleController.text,
                      descController.text,
                    );
                  },
                  child: Text('Click to Edit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
