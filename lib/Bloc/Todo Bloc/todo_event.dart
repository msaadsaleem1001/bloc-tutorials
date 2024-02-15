
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{

  const TodoEvent();

  @override
  List<Object?> get props => [];

}

class AddTodoEvent extends TodoEvent{
  final ToDoModel todoItem;

  const AddTodoEvent({required this.todoItem});

  @override
  List<Object?> get props => [todoItem];

}

class DeleteToDoEvent extends TodoEvent{
  final Object todo;

  const DeleteToDoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];

}
