part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTodoList extends HomepageEvent {}
