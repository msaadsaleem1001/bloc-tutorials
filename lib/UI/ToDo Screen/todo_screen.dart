import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(const AddTodoEvent(todo: 'Saad Saleem'));
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 30,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: const Text('ToDo\'s', style: TextStyle(
            color: Colors.white
        ),),
      ),
      body: SafeArea(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if(state.todoList.isEmpty){
              return const Center(child: Text('There is no ToDo\'s yet'),);
            }
            else if(state.todoList.isNotEmpty){
              return ListView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todoList[index]! + index.toString()),
                      trailing: IconButton(
                        onPressed: (){
                          context.read<TodoBloc>().add(DeleteToDoEvent(todo: state.todoList[index]!));
                        },
                        icon: const Icon(
                          Icons.delete_rounded, size: 25, color: Colors.black38,),
                      ),
                    );
                  }
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
