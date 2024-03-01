import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Screens/AddTodoScreen.dart';
import 'package:todo_app/Screens/EditTodoScreen.dart';

import '../Services/DeleteTodoFunction.dart';
import '../Services/EditTodoFunction.dart';
import '../Services/fetchDataFunction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  fetchItems() async {
    itemsList = await fetchDataFunction();
    setState(() {});
  }

  List itemsList = [];

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App API'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => AddTodoScreen(),
          );
        },
        child: Center(
          child: Text(
            'Add Todo',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: itemsList.length == 0
          ? Center(
              child: Text(
                'There is no any Todo',
                style: TextStyle(fontSize: 20),
              ),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    for (int index = 0; index < itemsList.length; index++) ...[
                      // var item=itemsList[index],
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString(),
                          ),
                        ),
                        title: Text(
                          itemsList[index]['title'].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          itemsList[index].toString(),
                        ),
                        trailing: PopupMenuButton(
                          onSelected: (value) {
                            print(value);
                            if (value == 'delete') {
                              String id = itemsList[index]['_id'];
                              print('id ==>>> $id');

                              DeleteTodoFunction(id);
                            }
                            //
                            if (value == 'edit') {
                              String id = itemsList[index]['_id'];
                              print('id ==>>> $id');
                              String title =
                                  itemsList[index]['title'].toString();
                              String description =
                                  itemsList[index]['description'].toString();
                              Get.to(() => EditTodoScreen(), arguments: {
                                'id': id,
                                'title': title,
                                'description': description,
                              });
                              // EditTodoFunction(id,title,description);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Edit'),
                              value: 'edit',
                            ),
                            PopupMenuItem(
                              child: Text('Delete'),
                              value: 'delete',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
