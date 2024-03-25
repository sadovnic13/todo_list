part of 'edit_todo_page_bloc.dart';

abstract class EditTodoPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EditTodo extends EditTodoPageEvent {
  EditTodo({
    required this.id,
    required this.title,
    required this.description,
    required this.finishDate,
  });

  final int id;
  final String title;
  final String description;
  final DateTime finishDate;
}
