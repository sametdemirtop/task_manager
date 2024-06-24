
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/utils/size/size_utils.dart';
import '../../../product/utils/validation/add_task_from_validation.dart';
import '../../../product/widgets/button/custom_button_widget.dart';
import '../../../product/widgets/text/custom_text_widget.dart';
import '../../../product/widgets/text_field/custom_text_field.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../model/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'addTask'.tr(), percentage: 0.025, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: ResponsiveUtil().paddingAll(context, percentage: 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: 'title'.tr(),
              obscureText: false,
              textEditingController: _titleController,
            ),
            CustomTextField(
              hintText: 'description'.tr(),
              obscureText: false,
              textEditingController: _descriptionController,
            ),
            CustomTextField(
              hintText: 'dueDate'.tr(),
              obscureText: false,
              textEditingController: _dateController,
            ),
            CustomTextField(
              hintText: 'imageUrl'.tr(),
              obscureText: false,
              textEditingController: _imageController,
            ),
            CustomButton(
              text: 'addTask'.tr(),
              isActive: true,
              hasIcon: false,
              onPressed: () {
                if (AddTaskFormValidation().checkIsValid(
                    _titleController.text,
                    _descriptionController.text,
                    _imageController.text,
                    _dateController.text) ==
                    true) {
                  final task = Task(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    image: _imageController.text,
                    dueDate: _dateController.text,
                  );
                  context.read<TaskBloc>().add(AddTask(task));
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }}
