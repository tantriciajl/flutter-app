import 'package:flutter/material.dart';
import 'package:task_management/components/task_card.dart';
import 'package:task_management/data/task_model.dart';
import 'package:task_management/data/tasks.dart';

import '../components/filter_pills.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected = '';

  @override
  Widget build(BuildContext context) {
    // to store the taskList containing
    // the list of tasks and their descriptions etc.
    // to allow to be used within the UI build
    var filteredList = taskList; // NEW

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
        leading: const Icon(Icons.person),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1) appBar filters
          FilterPills(onSelected: (value) {
            selected = 'All tasks';

            if (selected != 'All tasks') selected = value;

            // get enum type of value input
            testing(String value) {
              switch (value) {
                case 'Not started':
                  return CompletionStatus.notStarted;
                case 'In progress':
                  return CompletionStatus.inProgress;
                case 'Completed':
                  return CompletionStatus.completed;
                // output must be filteredList sorted according to category
                // category represented by completionStatus type
                // which is stored in new variable
              }
            }

            // keep enum type of value input
            var category = testing(value);

            // change list variable to include only filter cards of specific enum type
            filteredList =
                filteredList.where((task) => task.status == category).toList();

            // refresh UI to match change
            setState(() {});
          }),

          // 2) display task cards
          Expanded(
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: filteredList.length,
                prototypeItem: null,
                itemBuilder: (context, index) {
                  return TaskCard(filteredList[index]);
                }),
          ),
        ],
      ),
    );
  }
}
