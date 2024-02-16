
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:bloc_tutorials/Repositories/SQLITE%20DB/sqlite_db_repo.dart';
import '../../App Models/ToDo Model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final DatabaseRepository db;
  List<ToDoModel> toDoInActive = [];
  List<ToDoModel> toDoInProcess = [];
  List<ToDoModel> toDoCompleted = [];

  TodoBloc(this.db) : super(TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    // on<DeleteToDoEvent>(_deleteToDoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) async{
    emit(state.copyWith(addTodoInProcess: true));
    await db.insert(todo: event.todoItem);
    toDoInActive.add(event.todoItem);
    emit(state.copyWith(
      toDoInActive: List.from(toDoInActive),
      addTodoInProcess: false
    ));

  }

  // void _deleteToDoEvent(DeleteToDoEvent event, Emitter<TodoState> emit){
  //   todoList.remove(event.todo);
  //   emit(state.copyWith(todoList: List.from(todoList)));
  // }

}
