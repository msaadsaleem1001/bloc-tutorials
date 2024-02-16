
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TodoEvent extends Equatable{

  const TodoEvent();

  @override
  List<Object?> get props => [];

}

class AddTodoEvent extends TodoEvent{
  final ToDoModel todoItem;
  final BuildContext context;

  const AddTodoEvent({required this.todoItem, required this.context});

  @override
  List<Object?> get props => [todoItem, context];

}

class GetAllToDos extends TodoEvent{

  const GetAllToDos();

  @override
  List<Object?> get props => [];
}

class OnDragEvent extends TodoEvent{
  final int oldItemIndex;
  final int oldListIndex;
  final int newItemIndex;
  final int newListIndex;

  const OnDragEvent({
    required this.oldItemIndex,
    required this.oldListIndex,
    required this.newItemIndex,
    required this.newListIndex
  });

  @override
  List<Object?> get props => [oldItemIndex, oldListIndex, newItemIndex, newListIndex];
}

class UpdateEvent extends TodoEvent{
  final ToDoModel todoItem;
  final BuildContext context;
  final int listId;
  final int itemId;

  const UpdateEvent({
    required this.todoItem,
    required this.context,
    required this.listId,
    required this.itemId
  });

  @override
  List<Object?> get props => [todoItem, context, listId, itemId];

}

class DeleteToDoEvent extends TodoEvent{
  final ToDoModel todoItem;
  final int listIndex;
  final int itemIndex;

  const DeleteToDoEvent({required this.todoItem, required this.listIndex, required this.itemIndex});

  @override
  List<Object?> get props => [todoItem, listIndex, itemIndex];

}
