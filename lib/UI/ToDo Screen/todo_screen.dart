import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:bloc_tutorials/Utils/App%20Colors/app_colors.dart';
import 'package:bloc_tutorials/Utils/Textstyles/text_styles.dart';
import 'package:bloc_tutorials/Utils/Utils/dialog_box.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsator/pulsator.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: Pulsator(
          style: const PulseStyle(color: AppColors.appMenuColor),
          count: 3,
          duration: const Duration(seconds: 5),
          repeat: 0,
          startFromScratch: false,
          autoStart: true,
          fit: PulseFit.cover,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: AppColors.buttonColor, shape: BoxShape.circle),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                AppUtils.dialogAddToDo(context);
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.textColor,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.borderColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        blurStyle: BlurStyle.inner),
                  ],
                ),
              )),
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Task Manager',
                style: AppTextStyles.headerStyle()
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.buttonColor,
                child: Icon(
                  Icons.question_mark_rounded,
                  size: 30,
                  color: AppColors.textColor,
                ),
              )
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return DragAndDropLists(
                children: [
                  DragAndDropList(
                    canDrag: false,
                    header: Text('ToDo\'s', style: AppTextStyles.headerStyle(fontSize: 20)),
                    contentsWhenEmpty: Center(child: Text('Have not ToDo\'yet, Add some.', style: AppTextStyles.emptyStyle())),
                    footer: const SizedBox(height: 20),
                      children: List.generate(state.toDoInActive.length, (index) {
                    return DragAndDropItem(
                      canDrag: true,
                        child: Container(
                      margin: EdgeInsets.symmetric(vertical: height * .01),
                      width: width * .9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.borderColor,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.event_note_rounded,
                          size: 30,
                          color: AppColors.textColor,
                        ),
                        title: Text(state.toDoInActive[index].title,
                            style: const TextStyle(color: AppColors.textColor)),
                        subtitle: Text(state.toDoInActive[index].desc,
                            style: const TextStyle(color: AppColors.textColor)),
                        trailing: IconButton(
                          enableFeedback: false,
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded,
                              size: 30, color: AppColors.textColor),
                        ),
                      ),
                    ));
                  })),
                  DragAndDropList(
                      canDrag: false,
                      header: Text('In Process', style: AppTextStyles.headerStyle(fontSize: 20)),
                      contentsWhenEmpty: Center(child: Text('Have not ToDo\'s in process yet.', style: AppTextStyles.emptyStyle())),
                      footer: const SizedBox(height: 20),
                      children: List.generate(state.toDoInProcess.length, (index) {
                        return DragAndDropItem(
                          canDrag: true,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: height * .01),
                              width: width * .9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderColor,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignInside,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.event_note_rounded,
                                  size: 30,
                                  color: AppColors.textColor,
                                ),
                                title: Text(state.toDoInProcess[index].title,
                                    style: const TextStyle(color: AppColors.textColor)),
                                subtitle: Text(state.toDoInProcess[index].desc,
                                    style: const TextStyle(color: AppColors.textColor)),
                                trailing: IconButton(
                                  enableFeedback: false,
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_rounded,
                                      size: 30, color: AppColors.textColor),
                                ),
                              ),
                            ));
                      })),
                  DragAndDropList(
                    canDrag: false,
                      header: Text('Completed', style: AppTextStyles.headerStyle(fontSize: 20)),
                      contentsWhenEmpty: Center(child: Text('Have not completed ToDo\'yet.', style: AppTextStyles.emptyStyle())),
                      footer: const SizedBox(height: 20),
                      children: List.generate(state.toDoCompleted.length, (index) {
                        return DragAndDropItem(
                            canDrag: false,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: height * .01),
                              width: width * .9,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.borderColor,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignInside,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.event_note_rounded,
                                  size: 30,
                                  color: AppColors.textColor,
                                ),
                                title: Text(state.toDoCompleted[index].title,
                                    style: const TextStyle(color: AppColors.textColor)),
                                subtitle: Text(state.toDoCompleted[index].desc,
                                    style: const TextStyle(color: AppColors.textColor)),
                                trailing: IconButton(
                                  enableFeedback: false,
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_rounded,
                                      size: 30, color: AppColors.textColor),
                                ),
                              ),
                            ));
                      })),
                ],
                onItemReorder: (int oldItemIndex, int oldListIndex,
                    int newItemIndex, int newListIndex) {
                  debugPrint('OldItemIndex $oldItemIndex');
                  debugPrint('OldListIndex $oldListIndex');
                  debugPrint('NewItemIndex $newItemIndex');
                  debugPrint('NewListIndex $newListIndex');
                },
                onListReorder: (int oldListIndex, int newListIndex) {},
              );
            },
          ),
        ),
      ),
    );
  }
}
