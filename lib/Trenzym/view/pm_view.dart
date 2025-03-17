import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/appbar_icon.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/custom_text.dart';
import 'package:dashboard/Trenzym/widget/pm_widget/textwithicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dashboard_pm extends StatefulWidget {
  const dashboard_pm({super.key});

  @override
  State<dashboard_pm> createState() => _dashboard_pmState();
}

class _dashboard_pmState extends State<dashboard_pm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      // backgroundColor: AppColors.kPrimaryBtnColor,
      // mini: true,
      // child: Icon(Icons.add,color: Colors.white,size: 20),
      // ),
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
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextWithIcon(
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
              ListTile
              (
                title:  Text('Track any piece of information for your asset including IDs, meter\n readings, manuals and more.',
              style: TextStyle(fontSize: 8.sp),),
              trailing: Container(height: 34.h,width: 34.w,color: Colors.grey,
                child: Icon(Icons.print,color:AppColors.kPrimaryBtnColor ,)),
              ),
             
              SizedBox(height: 5.h,),
              container(),
              SizedBox(height: 10.h,),
             Container(
              width: 330.h,
              height: 80.w,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10.r), // Circular border
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 1, // Softness of the shadow
                    spreadRadius: 1, // Extent of the shadow
                    offset: Offset(1, 1), // Position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 30.w,bottom: 35.h),
                child: Row(
                  
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: SizedBox(height: 20.h,width: 100.w,
                    child:Text("Open PMs", style: TextStyle(fontSize:14.sp.sp)
                    ),
                    ),
                  )
                  // ,Padding(
                  //   padding:  EdgeInsets.only(left: 170.w),
                  //   child: Icon(Icons.print,color: AppColors.kPrimaryBtnColor,size: 20.h,),
                  // )
                ],),
              ),
            ),
            ///
             SizedBox(height: 10.h,),
             Container(
              width: 330.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10.r), // Circular border
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    blurRadius: 1, // Softness of the shadow
                    spreadRadius: 1, // Extent of the shadow
                    offset: Offset(1, 1), // Position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 20.w,bottom: 30.h),
                child: Row(
                  
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: SizedBox(height: 20.h,width: 100.w,
                    child:Text("Complete PMs", style: TextStyle(fontSize:14.sp)
                    ),
                    ),
                  )
                  ,Padding(
                    padding:  EdgeInsets.only(left: 170.w),
                    child:  Container(height: 34.h,width: 34.w,color: Colors.grey,
                child: Image(image: AssetImage('asset/image/upword.png'))),
                    
                  )
                ],),
              ),
            ),

SizedBox(height: 20.h,),
Padding(
  padding:  EdgeInsets.only(left: 250.w),
  child: Container(height: 50.h,width: 50.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50.r),
    color: AppColors.kPrimaryBtnColor
  
  ),
  child: Center(child: Icon(Icons.add,color: Colors.white,)),
  ),
)
                ]),
              
        ),
          
          
        ),
     );

  }
}

class container extends StatelessWidget {
  const container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 330.w,
    height: 200.h,
    padding: EdgeInsets.symmetric(vertical:0),
     // Adds some right padding
    decoration: BoxDecoration(
      // Optional border
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
       boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  blurRadius: 1.r, // Softness of the shadow
                  spreadRadius: 1.r, // Extent of the shadow
                  offset: Offset(1, 1), // Position of the shadow
                )],
      
    ),
    child: Padding(
      padding:  EdgeInsets.only(left: 25.w,top: 5.h),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the right
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: SizedBox(height: 20.h,width: 100.w,
                child:Text("Name", style: TextStyle(fontSize:14.sp.sp)
                ),
                ),
              )
              ,Padding(
                padding:  EdgeInsets.only(left: 170.w),
                child: Icon(Icons.more_vert,color: AppColors.kPrimaryBtnColor,size: 20.h,),
              )
            ],),
          )
        ,
        Padding(
          padding:  EdgeInsets.only(right: 20.h),
          child: Row(
            children: [
              Image(image: AssetImage('asset/row1.png',),height: 23.h,width: 23.w,),
              SizedBox(height: 36.h,
                  child:Text("HVVAC filter Change", style: TextStyle(fontSize:20.sp,color:AppColors.kPrimaryBtnColor,fontWeight: FontWeight.bold)
                  ),
                  ),
                
            ],
          ),
        ),
          Center(child: Padding(
            padding:  EdgeInsets.only(right: 30.w),
            child: Divider(height: 10.h,thickness: 1,),
          )),
          Padding(
                padding:  EdgeInsets.only(top: 2.h),
                child: SizedBox(height: 20.h,
                child:Text("Shedual", style: TextStyle(fontSize:14.sp)
                ),
                ),
              ),
               Padding(
                padding:  EdgeInsets.only(top: 7.h),
                child: SizedBox(height: 20.h,
                child:Text("Repeats every 1 day I Next due on Tue, Nov 19,2024", style: TextStyle(fontSize:14.sp.sp,color:Colors.blue)
                ),
                ),
              ),SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.only(top: 7.h),
                child: SizedBox(height: 15.h,
                child:Text("Assign To", style: TextStyle(fontSize:14.sp.sp)
                ),
                ),
              ),
               Padding(
                padding:  EdgeInsets.only(top: 7.w),
                child: SizedBox(height: 15.h,
                child:Text("Manger", style: TextStyle(fontSize:14.sp.sp,color:Colors.blue)
                ),
                ),
              )
        
        ],
      ),
    ),
              );
  }
}