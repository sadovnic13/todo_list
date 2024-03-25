import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

part 'add_todo_page_event.dart';
part 'add_todo_page_state.dart';

class AddTodoPageBloc extends Bloc<AddTodoPageEvent, AddTodoPageState> {
  AddTodoPageBloc(this.toDoRepositories) : super(AddTodoPageInitial()) {
    on<AddTodo>((event, emit) {
      try {
        emit(AddTodoPageLoading());
        toDoRepositories.setTodo(event.title, event.description, event.finishDate);
        emit(AddTodoPageLoaded());
      } catch (e) {
        emit(AddTodoPageFailure(exeption: e));
      }
    });
  }

  final ToDoRepositories toDoRepositories;
}
