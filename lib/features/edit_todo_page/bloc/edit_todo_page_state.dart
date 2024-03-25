part of 'edit_todo_page_bloc.dart';

abstract class EditTodoPageState extends Equatable {
  @override
  List<Object> get props => [];
}

final class EditTodoPageInitial extends EditTodoPageState {}

final class EditTodoPageLoading extends EditTodoPageState {}

final class EditTodoPageLoaded extends EditTodoPageState {}

final class EditTodoPageFailure extends EditTodoPageState {
  EditTodoPageFailure({required this.exeption});

  final Object? exeption;
}
