
import 'package:equatable/equatable.dart';

class ToDoModel extends Equatable{

  final int? id;
  final String title;
  final String desc;
  final String status;

  const ToDoModel({
    this.id,
    required this.title,
    required this.desc,
    required this.status
  });

  ToDoModel copyWith({int? id, String? title, String? desc, String? status}){
    return ToDoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        status: status ?? this.status
    );
  }

  factory ToDoModel.fromJson(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'],
      title: map['title'],
      desc: map['description'],
      status: map['status'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': desc,
      'status': status,
    };
  }


  @override
  List<Object?> get props => [id, title, desc, status];
}