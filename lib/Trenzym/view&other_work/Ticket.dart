import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/view/pm_view.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/appbar_icon.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/textwithicon.dart';
import 'package:dashboard/supplier/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarWithIcons(title: "Dashboard"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      Image.asset('asset/image/camera.png'),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(title: "HVAC-001", style: TextStyle(fontSize: 18)),
                      const Spacer(),
                      Image.asset(
                        'asset/image/row2.png',
                        height: 40.h,
                      ),
                      SizedBox(width: 5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Mark",
                            style:TextStyle(fontSize: 18.sp)
                            //  textTheme.displaySmall?.copyWith(height: 1.h),
                          ),
                          CustomText(
                              title: "Manager",
                              style: TextStyle(fontSize: 18.sp)
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
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 25,bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         TextWithIcon(
                          title: "Info",
                          imgPath: "asset/image/row2.png",
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        TextWithIcon(
                            imgPath: "asset/image/row2.png", title: "PMs"),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Tickets',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Parts',
                          style:TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Vendors',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Log',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Reports',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        CustomText(
                          title: 'Children',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile
              (
                title:  Text('Track any piece of information for your asset including IDs, meter\n readings, manuals and more.',
              style: TextStyle(fontSize: 8.sp),),
              trailing: Container(height: 34,width: 34,color:const Color.fromARGB(213, 165, 165, 165),
                child: Icon(Icons.print,color:AppColors.kPrimaryBtnColor ,))
                
                ,
              ),
      Padding(
        padding:  EdgeInsets.only(bottom: 20.h),
        child: Column(children: [
          Padding(
            padding:  EdgeInsets.only(right: 200.w,bottom: 3.h),
            child: Text('open ticket',style: TextStyle(color: Colors.black,fontSize: 18,),),
          ),
          Ticket_widget(),
          SizedBox(height: 20.h,),
          Ticket_widget(),
           SizedBox(height: 10.h,),
             Container(
              width: 320.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(241, 255, 255, 255), // Background color
                borderRadius: BorderRadius.circular(10.r), // Circular border
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 1, // Softness of the shadow
                    spreadRadius: 1.r, // Extent of the shadow
                    offset: Offset(1, 1), // Position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 0,bottom: 30.h),
                child: Row(
                  
                  children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w),
                    child: SizedBox(height: 20.h,width: 100.w,
                    child:Text("Complete PMs", style: TextStyle(fontSize:14.sp.sp)
                    ),
                    ),
                  )
                  ,Padding(
                    padding:  EdgeInsets.only(left: 150.w),
                    child:  Container(height: 34.h,width: 34.w,color: Colors.grey,
                child: Image(image: AssetImage('asset/image/upword.png',))),
                    
                  )
                ],),
              ),
            ),
          
        ],),
      )
              ]))));
  }
}

// ignore: camel_case_types
class Ticket_widget extends StatelessWidget {
  const Ticket_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(height: 231.h,width: 380.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.r),
              
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: flag_container(),
              title: Text('Name',style: TextStyle(fontSize: 13.sp),),
              subtitle: Text("HVVAC filter Change",
               style: TextStyle(fontSize:15.sp,color:AppColors.kPrimaryBtnColor,fontWeight: FontWeight.bold),
               ),
               trailing: Padding(
                 padding:  EdgeInsets.only(left: 10.w),
                 child: Container(height: 27.h,width: 50.w
                 ,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.kGrayLight1Color
                 ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 
                   Padding(
                     padding:  EdgeInsets.only(left: 5.w),
                     child: Icon(Icons.copy,size: 20.sp,),
                   ),
                  
                   Icon(Icons.delete_outline_outlined,color:AppColors.kTertiaryColor,size: 22.sp,),],),
                 ),),
        ),
         Padding(
           padding:  EdgeInsets.only(left: 40.w,right: 40.w,top: 20.h),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                       Text('Due Dte ',style: TextStyle(fontSize: 14.sp),),
                       Text('Assing To ',style:TextStyle())
                       
           ],),
         ),
          Padding(
           padding:  EdgeInsets.only(left: 40.w,right: 40.w,top: 10.h),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                       Text('Nov 23,34 ',style: TextStyle(fontSize: 14.sp,color: Colors.blue),),
                       Text('Manger ',style:TextStyle(fontSize: 14.sp,color: Colors.blue))
                       
           ],),
         ),
         Padding(
           padding: EdgeInsets.only(right: 180.w,top: 20.h),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
             padding: const EdgeInsets.only(),
             child: Text('Status',style: TextStyle(),),
           ),
            Padding(
             padding: const EdgeInsets.only(),
             child: Text('Open Task',style: TextStyle(color:AppColors.kPrimaryBtnColor),),
           )
           ],),
         ),
         
        
        
        
        ],
        ),
      )
      ),
    );
  }
}

// ignore: camel_case_types
class flag_container extends StatelessWidget {
  const flag_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 40.h,width: 40.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.white,
      border: Border.all(color: AppColors.kTertiaryColor,width: 2.w)
    ),
    child: Row(children: [
      Padding(
        padding:  EdgeInsets.only(left: 4.w),
        child: Icon(Icons.flag,color: AppColors.kTertiaryColor,size: 18.sp,),
      ),
      Text('#1',style: TextStyle(color: AppColors.kGrayDarkColor,fontSize: 10.sp),)
    ],),
    );
  }
}