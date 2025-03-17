import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/view/create_ticket.dart';
import 'package:dashboard/Trenzym/view/pm_view.dart';
import 'package:dashboard/Trenzym/widget/create_ticket/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Parts extends StatefulWidget {
  const Parts({super.key});

  @override
  State<Parts> createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          SizedBox(height: 50.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.h),
            child: Text('Below is a list of Spare Parts associated with this Asset so\n your team can easily know what Parts to use on this Asset.\n Part associations are built automatically as Parts are used on\n Tasks or you can manually associate them below.',
            style: TextStyle(fontSize: 10.sp),),
          ),
          SizedBox(height: 50.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              height: 210.h,
              width: 350.w,
              decoration: BoxDecoration(  
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(color: AppColors.kGrayDarkColor)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Center(child: InkWell(child: Text('Associated parts',style: TextStyle(fontSize: 12.sp),))),
                      
                       
                         ButtonWidget(title: 'Associated', onPress: (){ 
                          showCustomDialog(context);
                        },width: 130,)
                      
                      ],),
                    ),
                    Divider(thickness: 2.h,height: 45.h,),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('parts Name',style: TextStyle(fontSize: 12.sp),),
                               Text(' Quality',style: TextStyle(fontSize: 12.sp)),
                                  Text('Asset locaton',style: TextStyle(fontSize: 12.sp))
                      ],),
                      
                    ),
                         Divider(thickness: 2.h,),
                     Padding(
                      padding:  EdgeInsets.only(bottom: 10.h,top: 15.h,left: 10.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 40.w),
                            child: Text('Thermostate',style: TextStyle(fontSize: 12.sp),),
                          ),
                               Padding(
                                 padding:  EdgeInsets.only(right: 40.w),
                                 child: Text(' 1',style: TextStyle(fontSize: 14.sp)),
                               ),
                                  
                                     Text('First locaton',style: TextStyle(fontSize: 14.sp)),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Icon(Icons.delete,color: AppColors.kTertiaryColor,),
                                  )
                      ],),
                    )
                        ,
                      
                    
                  ],
                ),
              ),
            ),
            
          ),
          
        ],
      ),
    );
  }
  void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return 
    
         Dialog(
            
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
          
          child: SingleChildScrollView(
            child: Container(
              
              decoration: BoxDecoration(
                
                 color: const Color.fromARGB(54, 0, 0, 0),
                 borderRadius: BorderRadius.circular(7.r),
                  boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(58, 255, 255, 255), // Shadow color
                    blurRadius: 15.r, // Softness of shadow
                    spreadRadius: 25.r, // How much the shadow expands
                    offset: Offset(0, 0,), // X, Y offset of shadow
                  ),
                ],
              ),
             
              child: Padding(
                padding: EdgeInsets.all(12.h,),
                
                child: Column(
               
                  mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    // First Row: 3 Text Widgets + Close Icon
                    Row(
                      
                      children: [
                        
                        Text("Picks Parts", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                        Padding(
                          padding:  EdgeInsets.only(left: 5.w,bottom: 0),
                          child: Text("Select All", style: TextStyle(fontSize: 10.sp,color: Colors.blue)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 0,left: 3.w,right: 3.w),
                          child: Container(height: 15,width:1,color:  AppColors.kBlackColor,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Text("DeSelectall", style: TextStyle(fontSize: 10.sp,color: Colors.blue)),
                        ),
                        IconButton(
                            icon: Icon(Icons.close, color: Colors.black,size: 22.sp,),
                            onPressed: () => Navigator.pop(context),
                          ),
                        
                      ],
                    ),
                
                    SizedBox(height: 10.h),
            
                    // Container with Border
                  
                    Container(
                    
                      height: 350.h,
                      width: 350.w,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Filter Section
                          Container(height: 39.h,width: 250.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(7.r)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                            
                            ),
                          )
                          ),
                          
              
                          SizedBox(height: 40.h),
                
                          // Text Field 1
                          Container(
                            height: 50.h,
                            width: 280.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: const Color.fromARGB(40, 165, 165, 165)
                            ),
                            child: 
                            ListTile(
                            
                                title: Text('Termostate-002'),
                                trailing: Icon(Icons.remove_red_eye,color: AppColors.kPrimaryBtnColor,),
                            )
                          ),
                
                          SizedBox(height: 10.h),
                
                          // Text Field 2
                         Container(
                            height: 50.h,
                            width: 280.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(40, 165, 165, 165)
                            ),
                            child: 
                            ListTile(
                            
                                title: Text('Termostate-003'),
                                trailing: Icon(Icons.remove_red_eye,color: AppColors.kPrimaryBtnColor,),
                            )
                          ),
                        ],
                      ),
                    ),
                
                    SizedBox(height: 16.h),
                
                    // Two Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      ButtonWidget(title: 'Create Part', onPress: (){
                       Navigator.pop(context);
                      },width: 130.w,),
                        ButtonWidget(title: 'Select', onPress: (){},width: 110.w,)
                      ],
                    ),
                  ],
                ),
              ),
            
            ),
          ),
          
        );
});}
    }
  

