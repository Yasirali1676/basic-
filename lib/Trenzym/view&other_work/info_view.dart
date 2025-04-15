import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/widget/info_widget/custom_container.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/appbar_icon.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/textwithicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:maintenance_management_system/configs/color/color.dart';
// import 'package:maintenance_management_system/configs/components/custom_text.dart';
// import 'package:maintenance_management_system/configs/text/text_constants.dart';

// import 'package:maintenance_management_system/view/Osama/widgets/appbar_with_icons.dart';
// import 'package:maintenance_management_system/view/Osama/widgets/text_with_icon.dart';

class DashboardInfo extends StatelessWidget {
  const DashboardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWithIcons(title: "Dashboard"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Row(
                children: [
                  Image.asset('asset/camera.png'),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(title: "HVAC-001", style: TextStyle(fontSize: 18)),
                  const Spacer(),
                  Image.asset(
                    'asset/row2.png',
                    height: 40.h,
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Mark",
                        style:TextStyle(fontSize: 18)
                        //  textTheme.displaySmall?.copyWith(height: 1.h),
                      ),
                      CustomText(
                          title: "Manager",
                          style: TextStyle(fontSize: 18)
                          // textTheme.displaySmall?.copyWith(
                          //     height: 1.h, color: AppColors.kGrayDarkColor)
                              ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kGrayLight2Color),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 30.sp,
                        color: AppColors.kGrayLightColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                // height: 50,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: AppColors.kGrayLight1Color, width: 1.2))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWithIcon(
                        title: "Info",
                        imgPath: "asset/row2.png",
                      ),
                      SizedBox(
                        width: 70.w,
                      ),
                      TextWithIcon(
                          imgPath: "asset/row2.png", title: "PMs"),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Tickets',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Parts',
                        style:TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Vendors',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Log',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Reports',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      CustomText(
                        title: 'Children',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text('Track any piece of information for your asset including IDs, meter\n readings, manuals and more.',
            style: TextStyle(fontSize: 10.sp),),
            SizedBox(height: 30,),
           //name(title: 'Name'),
           category(image1: 'asset/delete.png',title: 'Name',button_title: 'Air condition',padding: 75,width: 111,),
           category(image1: 'asset/delete.png',title: 'Category',button_title: 'Air condition',padding: 48,width: 111,),
            category(image1: 'asset/delete.png',title: 'make',button_title: 'dawlance',padding: 78,width: 111,),
             category(image1: 'asset/delete.png',title: 'model',button_title: '001',padding: 73,width: 111,),
   
          ],
        ),
     ),
);
}
}
        