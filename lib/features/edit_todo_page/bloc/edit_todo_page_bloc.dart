import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/repositories/requests/todo_repositories.dart';

part 'edit_todo_page_event.dart';
part 'edit_todo_page_state.dart';

class EditTodoPageBloc extends Bloc<EditTodoPageEvent, EditTodoPageState> {
  EditTodoPageBloc(this.toDoRepositories) : super(EditTodoPageInitial()) {
    on<EditTodo>((event, emit) async {
      emit(EditTodoPageLoading());
      await toDoRepositories.updateTodo(event.id, event.title, event.description, event.finishDate);
      emit(EditTodoPageLoaded());
    });
  }

  final ToDoRepositories toDoRepositories;
}
