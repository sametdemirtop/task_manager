import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/constant/color_constant.dart';
import '../../../product/utils/size/size_utils.dart';
import '../../../product/widgets/button/custom_button_widget.dart';
import '../../../product/widgets/image/custom_image_view_widget.dart';
import '../../../product/widgets/text/custom_text_widget.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../model/task_model.dart';

class DetailTaskScreen extends StatelessWidget {
  const DetailTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'taskDetails'.tr(),
            percentage: 0.025,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ResponsiveUtil().width(context, percentage: 1),
              height: ResponsiveUtil().height(context,
                  percentage: 0.30), // Constrain the width of the image
              child: CustomImageView(
                imageUrl: task.image,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                    text: task.title,
                    percentage: 0.025,
                    fontWeight: FontWeight.bold),
                CustomText(
                    text: "(${task.dueDate})",
                    percentage: 0.015,
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.grayTextFieldInput)
              ],
            ),
            CustomText(text: task.description, percentage: 0.02),
            CustomButton(
              text: 'deleteTask'.tr(),
              isActive: true,
              hasIcon: false,
              colorButton: ColorConstant.redColor,
              onPressed: () {
                context.read<TaskBloc>().add(DeleteTask(task));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }}
