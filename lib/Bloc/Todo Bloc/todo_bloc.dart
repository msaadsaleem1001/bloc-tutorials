
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final List<String> todoList = [];

  TodoBloc() : super(TodoState()) {
    // on<AddTodoEvent>(_addTodoEvent);
    // on<DeleteToDoEvent>(_deleteToDoEvent);
  }

  // void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit){
  //   todoList.add(event.todo);
  //   emit(state.copyWith(todoList: List.from(todoList)));
  // }
  //
  // void _deleteToDoEvent(DeleteToDoEvent event, Emitter<TodoState> emit){
  //   todoList.remove(event.todo);
  //   emit(state.copyWith(todoList: List.from(todoList)));
  // }

}
