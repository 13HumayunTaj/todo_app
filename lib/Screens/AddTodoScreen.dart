import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/AddTodoFunction.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  //
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Todo'),
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
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: descController,
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
                    AddTodoFunction(titleController.text, descController.text);
                  },
                  child: Text('Click to Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
