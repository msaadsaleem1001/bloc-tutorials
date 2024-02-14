
import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  final List<String?> todoList;

  const TodoState({this.todoList = const []});

  TodoState copyWith ({List<String>? todoList}){
    return TodoState(todoList: todoList ?? this.todoList);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [todoList];

}
