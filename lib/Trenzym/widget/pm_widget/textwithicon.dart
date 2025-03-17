import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:maintenance_management_system/configs/components/custom_text.dart';
// import 'package:maintenance_management_system/configs/text/text_constants.dart';

class TextWithIcon extends StatelessWidget {
  final String title, imgPath;
  const TextWithIcon({super.key, required this.imgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imgPath),
        SizedBox(
          width: 10.w,
        ),
        CustomText(
          title: title,
          style: TextStyle( fontSize: 18,),
        )]);
    
}}