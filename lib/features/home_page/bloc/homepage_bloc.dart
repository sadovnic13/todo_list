import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/repositories/models/todo.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(this.toDoRepositories) : super(HomepageInitial()) {
    on<LoadTodoList>((event, emit) async {
      try {
        emit(HomepageLoading());
        final todoList = await toDoRepositories.getTodoList();
        emit(HomepageLoaded(todoList: todoList));
      } catch (e) {
        emit(HomepageFailure(exeption: e));
      }
    });
  }

  final ToDoRepositories toDoRepositories;
}
