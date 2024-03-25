import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/features/edit_todo_page/bloc/edit_todo_page_bloc.dart';
import 'package:todo_list/repositories/models/models.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final EditTodoPageBloc editTodoPageBloc = EditTodoPageBloc(ToDoRepositories());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final DateTime _date = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  ToDo? record;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null, "Route args error");
    record = args as ToDo;

    _title.text = record?.title ?? '';
    _description.text = record?.description ?? '';
    _focusedDay = record!.finishDate;
    _selectedDay = record!.finishDate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoPageBloc, EditTodoPageState>(
      bloc: editTodoPageBloc,
      listener: (context, state) {
        if (state is EditTodoPageLoaded) {
          Navigator.pushNamedAndRemoveUntil(context, '/home_page_screen', (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                // Web layout
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildForm(),
                      ),
                      Expanded(
                        child: _buildCalendar(),
                      ),
                    ],
                  ),
                );
              } else {
                // Mobile layout
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 20),
                      _buildCalendar(),
                    ],
                  ),
                );
              }
            },
          ),
        ),

        // Submit
        floatingActionButton: BlocBuilder<EditTodoPageBloc, EditTodoPageState>(
          bloc: editTodoPageBloc,
          builder: (context, state) {
            if (state is EditTodoPageLoading) {
              Future.delayed(Duration(seconds: 5));
              return ElevatedButton(
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: null,
              );
            }
            return ElevatedButton(
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  editTodoPageBloc.add(EditTodo(
                    id: record!.id,
                    title: _title.text,
                    description: _description.text,
                    finishDate: _selectedDay ?? _date,
                  ));
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          TextFormField(
            controller: _title,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            // onChanged: (value) {
            //   setState(() {
            //     _title = value;
            //   });
            // },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),

          // Description
          TextFormField(
            controller: _description,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            // onChanged: (value) {
            //   setState(() {
            //     _description = value;
            //   });
            // },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      firstDay: record!.finishDate,
      rowHeight: 45,
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
