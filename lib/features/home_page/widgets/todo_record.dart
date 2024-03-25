import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

import '../../../repositories/models/models.dart';

class ToDoRecord extends StatefulWidget {
  const ToDoRecord({super.key, required this.todo, required this.homepageBloc});
  final ToDo todo;
  final HomepageBloc homepageBloc;

  @override
  State<ToDoRecord> createState() => _ToDoRecordState();
}

class _ToDoRecordState extends State<ToDoRecord> {
  late bool isReady;

  @override
  void initState() {
    super.initState();
    isReady = widget.todo.isReady;
  }

  @override
  Widget build(BuildContext context) {
    final ToDoRepositories toDoRepositories = ToDoRepositories();

    return Card(
      child: ListTile(
        leading: IconButton(
          icon: isReady ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
          onPressed: () async {
            await toDoRepositories.updateTodo(widget.todo.id, !isReady);
            setState(() {
              isReady = !isReady;
            });
          },
        ),
        title: Text(
          widget.todo.title,
          style: TextStyle(decoration: isReady ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.todo.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text('Ready date: ${DateFormat('dd.MM.yyyy').format(widget.todo.finishDate)}')
          ],
        ),
        trailing: PopupMenuButton(
          onSelected: (value) {},
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                  onTap: () {
                    Navigator.pop(context);
                    widget.homepageBloc.add(DeleteToDoRecord(id: widget.todo.id));
                  },
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}