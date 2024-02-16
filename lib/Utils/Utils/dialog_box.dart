import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_model.dart';
import 'package:bloc_tutorials/App%20Models/ToDo%20Model/todo_status.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_bloc.dart';
import 'package:bloc_tutorials/Bloc/Todo%20Bloc/todo_state.dart';
import 'package:bloc_tutorials/Utils/App%20Colors/app_colors.dart';
import 'package:bloc_tutorials/Utils/Textstyles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Todo Bloc/todo_event.dart';

class AppUtils {
  static Future<void> dialogAddToDo(BuildContext context) {
    final formKeyTitle = GlobalKey<FormState>();
    final formKeyDesc = GlobalKey<FormState>();
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final focusTitle = FocusNode();
    final focusDesc = FocusNode();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            'Add ToDo',
            style: AppTextStyles.headerStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: width * .9,
            height: height * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKeyTitle,
                  child: TextFormField(
                    focusNode: focusTitle,
                    onFieldSubmitted: (val) {
                      focusTitle.unfocus();
                      FocusScope.of(context).requestFocus(focusDesc);
                    },
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      } else if (value.length >= 10) {
                        return null;
                      } else {
                        return 'Enter title at least ten characters';
                      }
                    },
                    maxLength: 100,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.buttonColor,
                    controller: titleController,
                    onChanged: (value) {
                      formKeyTitle.currentState!.validate();
                    },
                    style: AppTextStyles.emptyStyle(color: AppColors.textColor),
                    decoration: InputDecoration(
                      fillColor: AppColors.backgroundColor,
                      filled: true,
                      hintText: "Todo title",
                      hintStyle:
                          AppTextStyles.emptyStyle(color: AppColors.textColor),
                      label: Text(
                        'Todo title *',
                        style: AppTextStyles.emptyStyle(
                            color: AppColors.textColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKeyDesc,
                  child: TextFormField(
                    focusNode: focusDesc,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      } else if (value.length >= 30) {
                        return null;
                      } else {
                        return 'Description at least 30 characters';
                      }
                    },
                    maxLength: 250,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.buttonColor,
                    controller: descriptionController,
                    onChanged: (value) {
                      formKeyDesc.currentState!.validate();
                    },
                    onFieldSubmitted: (val) {
                      focusDesc.unfocus();
                    },
                    style: AppTextStyles.emptyStyle(color: AppColors.textColor),
                    decoration: InputDecoration(
                      fillColor: AppColors.backgroundColor,
                      filled: true,
                      hintText: "Todo description",
                      hintStyle:
                          AppTextStyles.emptyStyle(color: AppColors.textColor),
                      label: Text(
                        'Todo Description *',
                        style: AppTextStyles.emptyStyle(
                            color: AppColors.textColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: state.addTodoInProcess? false : true,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel')),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                              onPressed: () {
                                if (formKeyTitle.currentState!.validate() &&
                                    formKeyDesc.currentState!.validate()) {
                                  context.read<TodoBloc>().add(AddTodoEvent(
                                      todoItem: ToDoModel(
                                          title:
                                              titleController.text.toString(),
                                          desc: descriptionController.text
                                              .toString(),
                                          status: TodoStatus.inActive)));
                                }
                              },
                              child: state.addTodoInProcess
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator())
                                  : const Text('Add')),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
