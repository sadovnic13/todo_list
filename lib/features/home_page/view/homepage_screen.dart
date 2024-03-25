import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/home_page/bloc/homepage_bloc.dart';
import 'package:todo_list/features/home_page/widgets/action_filter.dart';
import 'package:todo_list/features/home_page/widgets/todo_record.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int parameter = 1;
  final HomepageBloc homepageBloc = HomepageBloc(ToDoRepositories());

  void updateParameter(int newParameter) {
    setState(() {
      parameter = newParameter;
    });
  }

  @override
  void didChangeDependencies() {
    homepageBloc.add(FilteringTodoList(parameter: parameter));

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
            onParameterChanged: updateParameter,
          )
        ],
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: homepageBloc,
        builder: (context, state) {
          if (state is HomepageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                homepageBloc.add(FilteringTodoList(parameter: parameter));
              },
              child: state.todoList.isEmpty
                  ? Center(
                      child: Text("You don't have plans"),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return ToDoRecord(
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
