// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_management/data/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ADD CODE BELOW

    // title font
    var titlefont = Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Color.fromRGBO(73, 69, 79, 1),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          fontSize: 16,
        );

    // description font
    var descriptionfont = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color.fromRGBO(73, 69, 79, 1),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          fontSize: 14,
        );

    // status font
    var statusfont = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color.fromRGBO(76, 76, 76, 1),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        );

    // start button font 'i.e. not start'
    var startbuttonfont = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Color.fromRGBO(103, 80, 164, 1),
          fontSize: 14,
          fontFamily: 'Roboto',
          letterSpacing: 0.1,
        );

    // pending button font i.e. 'mark as complete'
    var pendingbuttonfont = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 14,
          fontFamily: 'Roboto',
          letterSpacing: 0.1,
        );

    // start button style 'i.e. not start'
    var startbuttonstyle = OutlinedButton.styleFrom(
      foregroundColor: Color.fromRGBO(103, 80, 164, 1),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.all(20),
      side: BorderSide(
          color: Color.fromRGBO(73, 69, 79, 1),
          width: 0.75,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    );

    // pending button style i.e. 'mark as complete'
    var pendingbuttonstyle = OutlinedButton.styleFrom(
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color.fromRGBO(103, 80, 164, 1),
      padding: EdgeInsets.all(20),
      side: BorderSide(
          color: Color.fromRGBO(103, 80, 164, 1),
          width: 0.75,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    );

    // TITLE
    final tasktitle = Row(
      children: <Widget>[
        Icon(
          Icons.checklist_rounded,
          color: Color.fromRGBO(0, 0, 0, 1),
          size: 25,
        ),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              task.title,
              overflow: TextOverflow.ellipsis,
              style: titlefont,
            )),
      ],
    );

    // task description
    final taskdescription = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            task.description,
            overflow: TextOverflow.visible,
            style: descriptionfont,
            maxLines: 6,
          ),
        ),
      ],
    );

    // time, status, button
    final taskstatus = Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // time with icon i.e. '09:00 am'
              Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Color.fromRGBO(76, 76, 76, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      task.completeBy,
                      overflow: TextOverflow.visible,
                      style: statusfont,
                    ),
                  ),
                ],
              ),

              // status with icon i.e. 'Not Started'
              Row(
                children: <Widget>[
                  Icon(
                    Icons.remove_circle_outline,
                    color: Color.fromRGBO(76, 76, 76, 1),
                  ),
                  if (task.status == CompletionStatus.notStarted)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        task.getCompletionStatusText(),
                        overflow: TextOverflow.visible,
                        style: statusfont,
                      ),
                    ),
                  if (task.status == CompletionStatus.inProgress)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        task.getCompletionStatusText(),
                        overflow: TextOverflow.visible,
                        style: statusfont,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        // button i.e. 'Started'
        Column(
          children: [
            if (task.status == CompletionStatus.notStarted)
              OutlinedButton.icon(
                icon: Icon(
                  Icons.start,
                  size: 20,
                ),
                style: startbuttonstyle,
                label: Text(
                  'Start',
                  overflow: TextOverflow.ellipsis,
                  style: startbuttonfont,
                ),
                onPressed: () {},
              ),
            if (task.status == CompletionStatus.inProgress)
              OutlinedButton.icon(
                icon: Icon(
                  Icons.check_circle,
                  size: 20,
                ),
                style: pendingbuttonstyle,
                label: Text(
                  'Mark as Complete',
                  overflow: TextOverflow.ellipsis,
                  style: pendingbuttonfont,
                ),
                onPressed: () {},
              ),
          ],
        ),
      ],
    );

    // task card
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            blurRadius: 10,
            spreadRadius: -15.0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              tasktitle,
              SizedBox(height: 15),
              taskdescription, // task description
              SizedBox(height: 15),
              taskstatus, // time, status, button
            ],
          ),
        ),
      ),
    );
  }
}
