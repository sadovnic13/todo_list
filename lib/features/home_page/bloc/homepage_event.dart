part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// class LoadTodoList extends HomepageEvent {}

class DeleteToDoRecord extends HomepageEvent {
  final int id;
  final int parameter;
  final bool hideDoneTasks;

  DeleteToDoRecord({required this.id, required this.parameter, required this.hideDoneTasks});
}

class FilteringTodoList extends HomepageEvent {
  final int parameter;
  final bool hideDoneTasks;

  FilteringTodoList({required this.parameter, required this.hideDoneTasks});
}
