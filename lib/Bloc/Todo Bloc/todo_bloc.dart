
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_status.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:bloc_tutorials/Repositories/SQLITE%20DB/sqlite_db_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../App Models/ToDo Model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final DatabaseRepository db;
  List<ToDoModel> toDoInActive = [];
  List<ToDoModel> toDoInProcess = [];
  List<ToDoModel> toDoCompleted = [];
  List<ToDoModel> tempList = [];

  TodoBloc(this.db) : super(const TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<GetAllToDos>(_getAllTodosEvent);
    on<OnDragEvent>(_onDragEvent);
    on<UpdateEvent>(_updateEvent);
    on<DeleteToDoEvent>(_deleteToDoEvent);
  }

  void _onDragEvent(OnDragEvent event, Emitter<TodoState> emit) async{
    if(event.newListIndex == 0 && event.oldListIndex == 1){
      // In Process to todos so that's why nothing will be happen.
    }
    else if(event.newListIndex == 1 && event.oldListIndex == 0){
      // Todos to In process/ Inactive to In process
      final ToDoModel todo = ToDoModel(
          id: toDoInActive[event.oldItemIndex].id,
          title: toDoInActive[event.oldItemIndex].title,
          desc: toDoInActive[event.oldItemIndex].desc,
          status: TodoStatus.inProcess.toString(),
      );
      db.update(todo).then((value) {
        toDoInProcess.insert(event.newItemIndex, todo);
        toDoInActive.removeAt(event.oldItemIndex);
        emit(state.copyWith(
            toDoInActive: List.from(toDoInActive),
            toDoInProcess: List.from(toDoInProcess),
        ));
      });
    }
    else if(event.newListIndex == 2 && event.oldListIndex == 0){
      // Todos to Completed so that's why nothing will happen.
    }
    else if(event.newListIndex == 2 && event.oldListIndex == 1){
      // In process to Completed
      final ToDoModel todo = ToDoModel(
        id: toDoInProcess[event.oldItemIndex].id,
        title: toDoInProcess[event.oldItemIndex].title,
        desc: toDoInProcess[event.oldItemIndex].desc,
        status: TodoStatus.complete.toString(),
      );
      db.update(todo).then((value) {
        toDoCompleted.insert(event.newItemIndex, todo);
        toDoInProcess.removeAt(event.oldItemIndex);
        emit(state.copyWith(
          toDoInProcess: List.from(toDoInProcess),
          toDoCompleted: List.from(toDoCompleted),
        ));
      });
    }
    else if(event.newListIndex == event.oldListIndex ){
      // In Same List
      if(event.oldListIndex == 0){
        toDoInActive.insert(event.newItemIndex, toDoInActive[event.oldItemIndex]);
        toDoInActive.removeAt(event.oldItemIndex);
        emit(state.copyWith(
          toDoInActive: List.from(toDoInActive),
        ));
      }
      else if(event.oldListIndex == 1){
        toDoInProcess.insert(event.newItemIndex, toDoInProcess[event.oldItemIndex]);
        toDoInProcess.removeAt(event.oldItemIndex);
        emit(state.copyWith(
          toDoInProcess: List.from(toDoInProcess),
        ));
      }
      else{
        toDoCompleted.insert(event.newItemIndex, toDoCompleted[event.oldItemIndex]);
        toDoCompleted.removeAt(event.oldItemIndex);
        emit(state.copyWith(
          toDoCompleted: List.from(toDoCompleted),
        ));
      }
    }
    else{
      // Nothing will happen
    }
  }

  void _getAllTodosEvent(GetAllToDos event, Emitter<TodoState> emit) async{
    await db.getAllTodos().then((value) => tempList = value);
    if(tempList.isNotEmpty){
      for(int i = 0; i < tempList.length; i++){
        if(tempList[i].status == TodoStatus.inActive.toString()){
          toDoInActive.add(tempList[i]);
        }
        else if(tempList[i].status == TodoStatus.inProcess.toString()){
          toDoInProcess.add(tempList[i]);
        }
        else{
          toDoCompleted.add(tempList[i]);
        }
      }
    }
    emit(state.copyWith(
      toDoInActive: List.from(toDoInActive),
      toDoInProcess: List.from(toDoInProcess),
      toDoCompleted: List.from(toDoCompleted)
    ));
    tempList.clear();
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) async{
    emit(state.copyWith(addTodoInProcess: true));
    await db.insert(todo: event.todoItem);
    toDoInActive.add(event.todoItem);
    emit(state.copyWith(
      toDoInActive: List.from(toDoInActive),
      addTodoInProcess: false,
    ));
    Navigator.pop(event.context);
  }

  void _updateEvent(UpdateEvent event, Emitter<TodoState> emit) async{
    emit(state.copyWith(addTodoInProcess: true));
    await db.update(event.todoItem).then((value) {
      if(event.listId == 0){
        toDoInActive.removeAt(event.itemId);
        toDoInActive.insert(event.itemId, event.todoItem);
      }
      else if(event.listId == 1){
        toDoInProcess.removeAt(event.itemId);
        toDoInProcess.insert(event.itemId, event.todoItem);
      }
      else{
        toDoCompleted.removeAt(event.itemId);
        toDoCompleted.insert(event.itemId, event.todoItem);
      }
      emit(state.copyWith(
        toDoInActive: List.from(toDoInActive),
        toDoInProcess: List.from(toDoInProcess),
        toDoCompleted: List.from(toDoCompleted),
        addTodoInProcess: false
      ));
      Navigator.pop(event.context);
    });
  }

  void _deleteToDoEvent(DeleteToDoEvent event, Emitter<TodoState> emit) async{
    await db.delete(event.todoItem.id!).then((value) {
      if(event.listIndex == 0){
        toDoInActive.removeAt(event.itemIndex);
        emit(state.copyWith(toDoInActive: List.from(toDoInActive)));
      }
      else if(event.listIndex == 1){
        toDoInProcess.removeAt(event.itemIndex);
        emit(state.copyWith(toDoInProcess: List.from(toDoInProcess)));
      }
      else{
        toDoCompleted.removeAt(event.itemIndex);
        emit(state.copyWith(toDoCompleted: List.from(toDoCompleted)));
      }
    });
  }

}
