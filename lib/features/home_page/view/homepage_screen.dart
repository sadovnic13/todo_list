import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';
import '../bloc/homepage_bloc.dart';
import '../home_page.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int parameter = 1;
  bool hideDoneTasks = false;
  final HomepageBloc homepageBloc = HomepageBloc(ToDoRepositories());

  void updateParameter(int newParameter) {
    setState(() {
      parameter = newParameter;
    });
  }

  void updateHideCompletedTasks(bool newValue) {
    setState(() {
      hideDoneTasks = newValue;
    });
  }

  @override
  void didChangeDependencies() {
    homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add_todo_page_screen');
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Your ToDo list'),
        actions: [
          ActionFilter(
            homepageBloc: homepageBloc,
            parameter: parameter,
            hideDoneTasks: hideDoneTasks,
            onParameterChanged: updateParameter,
            onHideDoneTasksChanged: updateHideCompletedTasks,
          )
        ],
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: homepageBloc,
        builder: (context, state) {
          if (state is HomepageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                homepageBloc.add(FilteringTodoList(parameter: parameter, hideDoneTasks: hideDoneTasks));
              },
              child: state.todoList.isEmpty
                  ? const Center(
                      child: Text("You don't have plans"),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return ToDoRecord(
                          parameter: parameter,
                          hideDoneTasks: hideDoneTasks,
                          todo: state.todoList[index],
                          homepageBloc: homepageBloc,
                        );
                      },
                    ),
            );
          }

          if (state is HomepageFailure) {
            debugPrint('Error');
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
