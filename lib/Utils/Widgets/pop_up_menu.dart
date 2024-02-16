import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_event.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../App Colors/app_colors.dart';
import '../Textstyles/text_styles.dart';
import '../Utils/dialog_box.dart';

class AppPopUpMenu extends StatelessWidget {
  final int listId;
  final int index;
  final ToDoModel toDoModel;
  const AppPopUpMenu({
    super.key,
    required this.listId,
    required this.index,
    required this.toDoModel
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return PopupMenuButton(
          offset: const Offset(-25, -110),
          position: PopupMenuPosition.over,
          color: AppColors.appMenuColor,
          enableFeedback: false,
          shape: Border.all(
              color: AppColors.borderColor,
              strokeAlign: BorderSide.strokeAlignCenter,
              width: 2,
              style: BorderStyle.solid),
          icon: const Icon(Icons.more_vert_rounded,
              size: 30, color: AppColors.textColor),
          onSelected: (val) {
            if (val == 0) {
              // Call delete event
              context.read<TodoBloc>().add(DeleteToDoEvent(
                  todoId: toDoModel.id,
                  listIndex: listId,
                  itemIndex: index
              ));
            } else {
              AppUtils.dialogUpdateToDo(
                  listId,
                  index,
                  context,
                  listId == 0
                      ? state.toDoInActive[index]
                      : listId == 1
                          ? state.toDoInProcess[index]
                          : state.toDoCompleted[index]);
            }
          },
          itemBuilder: (BuildContext context) {
            return List.generate(
                state.popUpMenu.length,
                (index) => PopupMenuItem(
                    value: index,
                    child: Row(
                      children: [
                        Icon(
                            index == 0
                                ? Icons.delete
                                : Icons.edit_calendar_rounded,
                            color: AppColors.textColor),
                        const SizedBox(width: 20),
                        Text(state.popUpMenu[index],
                            style: AppTextStyles.emptyStyle(fontSize: 14)),
                      ],
                    )));
          },
        );
      },
    );
  }
}
