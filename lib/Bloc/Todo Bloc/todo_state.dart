
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  final List<ToDoModel> toDoInActive;
  final List<ToDoModel> toDoInProcess;
  final List<ToDoModel> toDoCompleted;
  final bool addTodoInProcess;

  const TodoState({
    this.toDoInActive = const [],
    this.toDoInProcess = const [],
    this.toDoCompleted = const [],
    this.addTodoInProcess = false
  });

  TodoState copyWith ({
    List<ToDoModel>? toDoInActive,
    List<ToDoModel>? toDoInProcess,
    List<ToDoModel>? toDoCompleted,
    bool? addTodoInProcess
  }){
    return TodoState(
      toDoInActive: toDoInActive ?? this.toDoInActive,
      toDoInProcess: toDoInProcess ?? this.toDoInProcess,
      toDoCompleted: toDoCompleted ?? this.toDoCompleted,
      addTodoInProcess: addTodoInProcess ?? this.addTodoInProcess
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [toDoInActive, toDoInProcess, toDoCompleted];

}
