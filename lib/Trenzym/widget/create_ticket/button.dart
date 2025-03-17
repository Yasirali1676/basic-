import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/widget/create_ticket/loading.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:maintenance_management_system/configs/components/custom_text.dart';
// import 'package:maintenance_management_system/configs/components/loading_widget.dart';
// import 'package:maintenance_management_system/configs/text/text_constants.dart';
// import '../color/color.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool loading;
  final IconData? buttonicon;
  final VoidCallback onPress;
  final double width, height;
  final IconData icon, backIcon;
  final bool isIcon, isIconBack;
  final Color iconColor, buttonColor, textColor, loadingColor;
  const ButtonWidget({
    super.key,
    required this.title,
    this.loading = false,
    this.buttonicon,
    required this.onPress,
    this.width = 95,
    this.height = 40,
    this.icon = Icons.arrow_forward_sharp,
    this.backIcon = Icons.arrow_back_sharp,
    this.isIcon = false,
    this.isIconBack = false,
    this.iconColor = AppColors.kWhiteColor,
    this.buttonColor = AppColors.kPrimaryBtnColor,
    this.textColor = AppColors.kWhiteColor,
    this.loadingColor = AppColors.kWhiteColor,
    TextStyle? textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: textColor == AppColors.kWhiteColor
              ? AppColors.kPrimaryColor
              : textColor,
        ),
      ),
      child: Center(
          child: loading
              ? LoadingWidget(
                  color: loadingColor,
                )
              : GestureDetector(
                  onTap: onPress,
                  child: Container(
                    color: Colors.transparent,
                    height: height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isIconBack
                            ? Icon(
                                backIcon,
                                color: iconColor,
                                size: 18,
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Icon(buttonicon,size: 20,color:AppColors.kBackgroundColor,),
                        ),
                         Center(
                           child: Padding(
                             padding: const EdgeInsets.only(right: 5),
                             child: CustomText(
                                title: title,
                                style: TextStyle(
                                  fontSize: 15,color: textColor
                                )
                              ),
                           ),
                         ),
                        
                        SizedBox(
                          width: 10.w,
                        ),
                        isIcon
                            ? Icon(
                                icon,
                                color: iconColor,
                                size: 18,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                )),
);
}
}