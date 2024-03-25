import 'package:flutter/material.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';

class ActionFilter extends StatefulWidget {
  final HomepageBloc homepageBloc;
  final int parameter;
  final ValueChanged<int> onParameterChanged;

  const ActionFilter(
      {super.key, required this.homepageBloc, required this.onParameterChanged, required this.parameter});

  @override
  State<ActionFilter> createState() => _ActionFilterState();
}

class _ActionFilterState extends State<ActionFilter> {
  Icon icon = Icon(Icons.filter_alt_outlined);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          //performance filtering
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.playlist_add_check),
              title: Text(
                'Performance',
                style: TextStyle(fontWeight: widget.parameter == 1 ? FontWeight.w900 : FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                widget.onParameterChanged(1);

                widget.homepageBloc.add(FilteringTodoList(parameter: 1));
              },
            ),
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
              onTap: () {
                Navigator.pop(context);
                widget.onParameterChanged(2);

                widget.homepageBloc.add(FilteringTodoList(parameter: 2));
              },
            ),
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
              onTap: () {
                Navigator.pop(context);
                widget.onParameterChanged(3);

                widget.homepageBloc.add(FilteringTodoList(parameter: 3));
              },
            ),
          ),
        ];
      },
    );
  }
}
