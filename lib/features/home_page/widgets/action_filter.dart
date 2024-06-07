import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';
import 'package:todo_list/generated/l10n.dart';

///Widget for creating filter and sorting menus
///[homepageBloc] - page block
////[parameter] - sorting parameter
///[hideDoneTask] - method of displaying completed tasks
///[onParameterChanged] - method of sorting parameter change
///[onHideDoneTasksChanged] - method of changing the display of tasks
class ActionFilter extends StatefulWidget {
  final int parameter;
  final bool hideDoneTasks;
  final ValueChanged<int> onParameterChanged;
  final ValueChanged<bool> onHideDoneTasksChanged;

  const ActionFilter({
    super.key,
    required this.onParameterChanged,
    required this.parameter,
    required this.hideDoneTasks,
    required this.onHideDoneTasksChanged,
  });

  @override
  State<ActionFilter> createState() => _ActionFilterState();
}

class _ActionFilterState extends State<ActionFilter> {
  @override
  Widget build(BuildContext context) {
    final homepageBloc = BlocProvider.of<HomepageBloc>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt_outlined),
      onSelected: (value) {},
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          //performance filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.playlist_add_check),
              title: Text(
                S.of(context).performance,
                style: TextStyle(fontWeight: widget.parameter == 1 ? FontWeight.w900 : FontWeight.w400),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(1);

              homepageBloc.add(FilteringTodoList(parameter: 1, hideDoneTasks: widget.hideDoneTasks));
            },
          ),
          //end date filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.date_range),
              title: Text(
                S.of(context).finishDate,
                style: TextStyle(
                  fontWeight: widget.parameter == 2 ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(2);

              homepageBloc.add(FilteringTodoList(parameter: 2, hideDoneTasks: widget.hideDoneTasks));
            },
          ),
          //creation date filtering filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.add_comment_rounded),
              title: Text(
                S.of(context).creationDate,
                style: TextStyle(
                  fontWeight: widget.parameter == 3 ? FontWeight.w900 : FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              widget.onParameterChanged(3);

              homepageBloc.add(FilteringTodoList(parameter: 3, hideDoneTasks: widget.hideDoneTasks));
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
                  homepageBloc.add(FilteringTodoList(parameter: widget.parameter, hideDoneTasks: value));
                },
              ),
              title: Text(
                S.of(context).hideDoneTasks,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {
              bool newValue = !widget.hideDoneTasks;
              widget.onHideDoneTasksChanged(newValue);
              homepageBloc.add(FilteringTodoList(parameter: widget.parameter, hideDoneTasks: newValue));
            },
          ),
        ];
      },
    );
  }
}
