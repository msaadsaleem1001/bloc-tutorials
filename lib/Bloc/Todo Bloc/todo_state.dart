
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  List<ToDoModel> toDoInActive;
  List<ToDoModel> toDoInProcess;
  List<ToDoModel> toDoCompleted;

  TodoState({
    this.toDoInActive = const [],
    this.toDoInProcess = const [],
    this.toDoCompleted = const []
  });

  TodoState copyWith ({List<ToDoModel>? toDoInActive, List<ToDoModel>? toDoInProcess, List<ToDoModel>? toDoCompleted}){
    return TodoState(
      toDoInActive: toDoInActive ?? this.toDoInActive,
      toDoInProcess: toDoInProcess ?? this.toDoInProcess,
      toDoCompleted: toDoCompleted ?? this.toDoCompleted
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [toDoInActive, toDoInProcess, toDoCompleted];

}
