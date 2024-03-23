part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  @override
  List<Object> get props => [];
}

final class HomepageInitial extends HomepageState {}

final class HomepageLoading extends HomepageState {}

final class HomepageLoaded extends HomepageState {
  HomepageLoaded({required this.todoList});

  final List<ToDo> todoList;
}

final class HomepageFailure extends HomepageState {
  HomepageFailure({required this.exeption});

  final Object? exeption;
}
