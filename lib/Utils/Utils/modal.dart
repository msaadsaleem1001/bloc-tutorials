


import 'package:bloc_tutorials/Utils/App%20Colors/app_colors.dart';
import 'package:bloc_tutorials/Utils/Textstyles/text_styles.dart';
import 'package:flutter/material.dart';

class AppUtils {


  static Future<void> dialogAddToDo(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          title: Text('Add ToDo', style: AppTextStyles.headerStyle(fontSize: 20), textAlign: TextAlign.center,),
          content: SizedBox(
            width: width * .9,
            height: height * .3,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      } else if (value.length >= 10) {
                        return null;
                      } else {
                        return 'Please enter title at least ten characters';
                      }
                    },
                    maxLength: 100,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.buttonColor,
                    controller: titleController,
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                      hintText: "Todo title",
                      label: const Text('Todo title *'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      } else if (value.length >= 50) {
                        return null;
                      } else {
                        return 'Please enter description at least 50 characters';
                      }
                    },
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    maxLength: 250,
                    controller: descriptionController,
                    onChanged: (value) {
                      formKey.currentState!.validate();
                    },
                    decoration: InputDecoration(
                      hintText: 'Todo description',
                      label: const Text('Todo description *'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

}