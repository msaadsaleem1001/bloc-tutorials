
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{

  const TodoEvent();

  @override
  List<Object?> get props => [];

}

class AddTodoEvent extends TodoEvent{
  final String todo;

  const AddTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];

}

class DeleteToDoEvent extends TodoEvent{
  final Object todo;

  const DeleteToDoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];

}
