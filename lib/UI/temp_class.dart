// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:todo_app/repository/database_repository.dart';
// import 'package:todo_app/todomodel.dart';
//
// class AddTodoScreen extends StatefulWidget {
//   final String buttonName;
//   final ToDoModel toDoModel;
//   final Function updateCallBackFunction;
//   const AddTodoScreen({
//     Key? key,
//     required this.toDoModel,
//     required this.buttonName,
//     required this.updateCallBackFunction,
//   }) : super(key: key);
//
//   @override
//   State<AddTodoScreen> createState() => _AddTodoScreenState();
// }
//
// class _AddTodoScreenState extends State<AddTodoScreen> {
//   int count = 0, imp = 0;
//   bool important = false, spinner = false;
//   final titleController = TextEditingController();
//   final subtitleController = TextEditingController();
//
//   void addTodo() async {
//     if (widget.toDoModel.title == '' &&
//         widget.toDoModel.description == '' &&
//         widget.toDoModel.isImportant == false) {
//       ToDoModel todo = ToDoModel(
//           title: titleController.text,
//           description: subtitleController.text,
//           isImportant: important);
//       DatabaseRepository.instance.insert(todo: todo).then((value) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text('Added Successfully')));
//         setState(() {
//           titleController.text = '';
//           subtitleController.text = '';
//           important = false;
//           widget.updateCallBackFunction();
//         });
//       }).catchError((e) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(e.toString())));
//       });
//     } else {
//       ToDoModel todoUpdate = ToDoModel(
//           id: widget.toDoModel.id,
//           title: titleController.text,
//           description: subtitleController.text,
//           isImportant: important);
//       DatabaseRepository.instance.update(todoUpdate).then((value) {
//         if (widget.updateCallBackFunction()) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Updated Successfully')));
//           FocusScope.of(context).unfocus();
//           Timer(
//               const Duration(milliseconds: 1500), () => Navigator.pop(context));
//         }
//       }).catchError((e) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(e.toString())));
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     subtitleController.dispose();
//     super.dispose();
//   }
//
//   void initDb() async {
//     await DatabaseRepository.instance.database;
//   }
//
//   @override
//   void initState() {
//     initDb();
//     super.initState();
//   }
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final brightness = MediaQuery.of(context).platformBrightness;
//     final themes = Theme.of(context);
//     if (count == 0) {
//       if (widget.toDoModel.title == '' && widget.toDoModel.description == '') {
//         titleController.text = widget.toDoModel.title;
//         subtitleController.text = widget.toDoModel.description;
//         if (imp == 0) {
//           if (widget.toDoModel.isImportant) {
//             important = true;
//           } else {
//             important = false;
//           }
//         }
//       } else {
//         titleController.text = widget.toDoModel.title;
//         subtitleController.text = widget.toDoModel.description;
//         if (imp == 0) {
//           important = widget.toDoModel.isImportant;
//         }
//       }
//     }
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(widget.buttonName),
//         actions: [
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 titleController.text = '';
//                 subtitleController.text = '';
//                 important = false;
//               });
//             },
//             icon: const Padding(
//               padding: EdgeInsets.only(right: 10),
//               child: Icon(Icons.cleaning_services_outlined),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Stack(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
//                     child: spinner? const Center(
//                       child: CircularProgressIndicator(
//                         strokeWidth: 4.0,
//                         color: Colors.greenAccent,
//                       ),
//                     ) : const SizedBox(),
//                   ),
//
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }