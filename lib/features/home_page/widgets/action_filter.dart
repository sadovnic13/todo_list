import 'package:flutter/material.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';

class ActionFilter extends StatefulWidget {
  final HomepageBloc homepageBloc;
  final int parameter;
  final bool hideDoneTasks;
  final ValueChanged<int> onParameterChanged;
  final ValueChanged<bool> onHideDoneTasksChanged;

  const ActionFilter({
    super.key,
    required this.homepageBloc,
    required this.onParameterChanged,
    required this.parameter,
    required this.hideDoneTasks,
    required this.onHideDoneTasksChanged,
  });

  @override
  State<ActionFilter> createState() => _ActionFilterState();
}

class _ActionFilterState extends State<ActionFilter> {
  Icon icon = const Icon(Icons.filter_alt_outlined);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      onSelected: (value) {},
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          //performance filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.playlist_add_check),
              title: Text(
                'Performance',
                style: TextStyle(fontWeight: widget.parameter == 1 ? FontWeight.w900 : FontWeight.w400),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(1);

              widget.homepageBloc.add(FilteringTodoList(parameter: 1, hideDoneTasks: widget.hideDoneTasks));
            },
          ),
          //end date filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(
                'Finish date',
                style: TextStyle(
                  fontWeight: widget.parameter == 2 ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(2);

              widget.homepageBloc.add(FilteringTodoList(parameter: 2, hideDoneTasks: widget.hideDoneTasks));
            },
          ),
          //creation date filtering filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.add_comment_rounded),
              title: Text(
                'Сreation date',
                style: TextStyle(
                  fontWeight: widget.parameter == 3 ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(3);

              widget.homepageBloc.add(FilteringTodoList(parameter: 3, hideDoneTasks: widget.hideDoneTasks));
            },
          ),
          const PopupMenuDivider(),

          //hide tasks checker
          PopupMenuItem(
            child: ListTile(
              leading: Checkbox(
                value: widget.hideDoneTasks,
                onChanged: (value) {
                  Navigator.pop(context);
                  widget.onHideDoneTasksChanged(value!);
                  widget.homepageBloc.add(FilteringTodoList(parameter: widget.parameter, hideDoneTasks: value));
                },
              ),
              title: const Text(
                'Hide done tasks',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              bool newValue = !widget.hideDoneTasks;
              widget.onHideDoneTasksChanged(newValue);
              widget.homepageBloc.add(FilteringTodoList(parameter: widget.parameter, hideDoneTasks: newValue));
            },
          ),
        ];
      },
    );
  }
}
