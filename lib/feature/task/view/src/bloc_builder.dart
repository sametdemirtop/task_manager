import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/constant/color_constant.dart';
import '../../../../product/utils/size/size_utils.dart';
import '../../../../product/widgets/image/custom_image_view_widget.dart';
import '../../../../product/widgets/text/custom_text_widget.dart';
import '../../bloc/task_bloc.dart';
import '../../bloc/task_state.dart';

class BlocBuilderClass extends StatelessWidget {
  const BlocBuilderClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskLoaded) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return Padding(
                padding: ResponsiveUtil().paddingAll(context, percentage: 0.03),
                child: Container(
                  padding: ResponsiveUtil().paddingAll(context, percentage: 0.015),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorConstant.blackTextFieldInput,
                        width: 2,
                      )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: ResponsiveUtil().width(context, percentage: 0.2),
                        height: ResponsiveUtil().height(context, percentage: 0.1), // Constrain the width of the image
                        child: CustomImageView(
                          imageUrl: task.image,
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: CustomText(
                            text: task.title,
                            percentage: 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                          subtitle: CustomText(text: task.description, percentage: 0.015),
                          trailing: CustomText(text: "(${task.dueDate})", percentage: 0.0135, fontWeight: FontWeight.w400, color: ColorConstant.grayTextFieldInput),
                          onTap: () {
                            Navigator.pushNamed(context, '/details', arguments: task);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CustomText(text: 'failedToLoadTasks'.tr(), percentage: 0.02));
        }
      },
    );
  }
}
