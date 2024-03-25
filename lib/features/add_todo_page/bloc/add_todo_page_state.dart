part of 'add_todo_page_bloc.dart';

abstract class AddTodoPageState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AddTodoPageInitial extends AddTodoPageState {}

final class AddTodoPageLoading extends AddTodoPageState {}

final class AddTodoPageLoaded extends AddTodoPageState {}

final class AddTodoPageFailure extends AddTodoPageState {
  AddTodoPageFailure({required this.exeption});

  final Object? exeption;
}
