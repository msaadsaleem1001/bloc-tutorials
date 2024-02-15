

import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_status.dart';
import 'package:equatable/equatable.dart';

class ToDoModel extends Equatable{

  final int id;
  final String title;
  final String desc;
  final TodoStatus status;

  const ToDoModel({
    required this.id,
    required this.title,
    required this.desc,
    this.status = TodoStatus.inActive
  });

  ToDoModel copyWith({int? id, String? title, String? desc, TodoStatus? status}){
    return ToDoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        status: status ?? this.status
    );
  }


  @override
  List<Object?> get props => [id, title, desc, status];
}