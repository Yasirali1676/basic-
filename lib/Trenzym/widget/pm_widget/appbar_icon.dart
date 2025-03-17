import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/view/pm_view.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:maintenance_management_system/configs/color/color.dart';
// import 'package:maintenance_management_system/configs/components/custom_text.dart';
// import 'package:maintenance_management_system/configs/text/text_constants.dart';

class AppBarWithIcons extends StatelessWidget {
  final String title;
  final bool isPopUpMenu;
  final Widget? child;
  const AppBarWithIcons({
    super.key,
    required this.title,
    this.isPopUpMenu = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        Image.asset("asset/image/appbar.jpg"),
        Positioned(
          top: 55,
          left: 0,
          right: 0,
          child: AppBar(
            title: CustomText(
              title: title,
              style: TextStyle(color: AppColors.kWhiteColor,)
                
              ),
            
            backgroundColor: Colors.transparent,
            centerTitle: true,
            scrolledUnderElevation: 0,
            foregroundColor: AppColors.kWhiteColor,
            actions: [
              isPopUpMenu ? child! : SizedBox(),
              Row(
                children: [
                  Image.asset(
                    "asset/image/download.jpg",
                    width: 35.w,
                    height: 35.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  
                  Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber
                  ),
                    child: Image.asset(
                      "asset/image/print.jpg",scale: 1,
                      fit: BoxFit.fitHeight,
                      width: 35.w,
                      height: 35.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              )
            ],
          ),
        ),
     ],
);
}
}