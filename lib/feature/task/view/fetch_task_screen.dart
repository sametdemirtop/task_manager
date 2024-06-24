import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kodiks_app/feature/task/view/src/bloc_builder.dart';
import 'package:kodiks_app/product/utils/size/size_utils.dart';
import '../../../product/widgets/button/custom_button_widget.dart';
import '../../../product/widgets/text/custom_text_widget.dart';

class FetchTaskScreen extends StatelessWidget {
  const FetchTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'tasks'.tr(), percentage: 0.03, fontWeight: FontWeight.bold),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              context.setLocale(locale);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              const PopupMenuItem<Locale>(
                value: Locale('en', 'US'),
                child: Text('English'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('tr', 'TR'),
                child: Text('Türkçe'),
              ),
            ],
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Padding(
        padding: ResponsiveUtil().paddingAll(context, percentage: 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 8,
              child: BlocBuilderClass(),
            ),
            Expanded(
              flex: 1,
              child: CustomButton(
                text: 'goAddTask'.tr(),
                isActive: true,
                hasIcon: false,
                onPressed: () => Navigator.pushNamed(context, '/add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
