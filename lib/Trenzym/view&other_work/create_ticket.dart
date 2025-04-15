// ignore_for_file: non_constant_identifier_names

import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:dashboard/Trenzym/widget/create_ticket/button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}
List<String> option =[ 'Unpalned', 'Planed,'];
class _CreateTicketState extends State<CreateTicket> {
  String Currentoption = option[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(children: [
            SizedBox(height: 50.h,),
            Padding(
              padding:  EdgeInsets.only(right: 280.w,bottom: 10.h),
              child: Text('Name',style: TextStyle(fontSize: 12.sp),),
            ),
          
           textfield(),
             SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(right: 250.w,bottom: 10.h),
              child: Text('Instruction',style: TextStyle(fontSize: 12.sp),),
            ),
             textfield(),
             Padding(
              padding:  EdgeInsets.only(right: 265.w,top: 10.h),
              child: Text('Asset',style: TextStyle(fontSize: 12.sp),),),
               Padding(
              padding:  EdgeInsets.only(right: 160.w,top: 10.h),
              child: Text('HVAC-001',style: 
              TextStyle(fontSize: 17.sp,color: AppColors.kPrimaryBtnColor,fontWeight: FontWeight.bold),),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 470.h,
                  width:374.w ,
                   decoration: BoxDecoration(
                    color: AppColors.kBackgroundColor,
                      boxShadow: [
      BoxShadow(
        
        color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
        spreadRadius: 3, // How much the shadow spreads
        blurRadius: 5,  // How blurry the shadow is
        offset: Offset(0, 4), // Changes the position of shadow (X, Y)
      ),
    ],
                    borderRadius: BorderRadius.circular(7.r),
                       border: Border.all(color: const Color.fromARGB(140, 118, 118, 118)),
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h,),
              Text('Task  Status'),
          Row(children: [
             button(buttonColor:AppColors.kPrimaryColor,title: ' Open task',image: 'asset/image/lockicon.png',textColor:AppColors.kBackgroundColor,),
             SizedBox(width: 6.w,),
             button(buttonColor: AppColors.kBackgroundColor,title: ' inProgres',image: 'asset/image/list.png',textColor: AppColors.kPrimaryBtnColor,),
                SizedBox(width: 6.w,),
             button(buttonColor: AppColors.kBackgroundColor,title: 'Completed',image: 'asset/image/true.png',textColor: AppColors.kPrimaryBtnColor,)],), 
              SizedBox(height: 10.h,),
              Text('Add picture',style: TextStyle(fontSize: 12.sp),),
              SizedBox(height: 10.h,),
           DottedBorder(
            color: AppColors.kPrimaryBtnColor, // Border color
            strokeWidth: 2.w, // Border width
            dashPattern: [3.w, 3.h], // Dash pattern: [dot size, space size]
            borderType: BorderType.RRect, // Rounded rectangle border
            radius: Radius.circular(12), // Rounded corners
            child:
              Container(
                height: 35.h,
                width: 220.w,
                decoration: BoxDecoration(
                
                ),
                child: Center(child: Icon(Icons.camera_alt,color: AppColors.kGrayDarkColor,)),
              )),
              Padding(
                padding:  EdgeInsets.only(top: 15.h,bottom: 6.h),
                child: Text('Priority',style: TextStyle(fontSize: 12.sp)),
              ),
              icons_textfield( icon: Icons.flag_outlined,color: AppColors.kTertiaryColor,hinttext: 'Priority',),
               Padding(
                padding:  EdgeInsets.only(top: 15.h,bottom: 6.h),
                child: Text('Due Date',style: TextStyle(fontSize: 12.sp)),
              ),
              icons_textfield( icon: Icons.calendar_month,color: AppColors.kPrimaryBtnColor,),
               Padding(
                padding:  EdgeInsets.only(top: 15.h,bottom: 6.h,left: 0),
                child: Text('Location',style: TextStyle(fontSize: 12.sp)),
              ),
              icons_textfield( ),

              Padding(
                padding:  EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10),
                child: Text('Type'),
              ),
              Row(
                children: [
                  Radio(value: option[0], groupValue: Currentoption, onChanged: (value){
                  setState(() {
                    Currentoption =value.toString();
                  });
                }),
                Text(option[0],style: TextStyle(fontSize: 16.sp)),
                SizedBox(width: 30.w,),
                Radio(value: option[1], groupValue: Currentoption, onChanged: (value){
                  setState(() {
                    Currentoption =value.toString();
                  });
                }),
                Text(option[1],style: TextStyle(fontSize: 16.sp),),
                ],
              )
              
              ], ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Assing To',style: TextStyle(fontSize: 12.sp)),
                    button(buttonColor: AppColors.kPrimaryBtnColor,title:'Add user',image: 'asset/image/add.png',textColor: AppColors.kBackgroundColor,)
                  ],
                ),
              ),
               Padding(
                padding:  EdgeInsets.only(top: 0.h,bottom: 10.h,right: 240),
                child: Text('Teams',style: TextStyle(fontSize: 12),),
              ),
             Container(
              height: 44.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kGrayDarkColor),
                borderRadius: BorderRadius.circular(7) ),
                child: Center(child: Text('Air Condition Miantanance',style: TextStyle(fontSize: 16.sp),)),
             ),
             SizedBox(height: 20.h,),Container(
              height: 44.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kGrayDarkColor),
                borderRadius: BorderRadius.circular(7.r)
   ),
                child: Center(child: Text('Fridge Miantanance',style: TextStyle(fontSize: 16.sp),)),
             ),
              Padding(
                padding:  EdgeInsets.only(top: 10.h,bottom: 10.h,right: 240.w),
                child: Text('User',style: TextStyle(fontSize: 12.sp),),
              ),
             Container(
              height: 44.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kGrayDarkColor),
                borderRadius: BorderRadius.circular(7)),
              child: Center(child: Text('Mark - Manager',style: TextStyle(fontSize: 16.sp),)),
             ),
             SizedBox(height: 20.h,),Container(
              height: 44.h,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kGrayDarkColor),
                borderRadius: BorderRadius.circular(7)
  ),
               child: Center(child: Text('Daivad james techination',style: TextStyle(fontSize: 16.sp),)), 
             ),
           Padding(
             padding:  EdgeInsets.only(top: 20.h,bottom: 10.h,right: 190.w),
             child: Container(
                   height: 34.h,
                   width: 120.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.r),
                  
             color: const Color.fromARGB(150, 165, 165, 165)
                   ),
                   child: Row(children: [
                    Icon(Icons.add,color: AppColors.kPrimaryColor,size: 18,),
                    Text('Setup Teams',style: TextStyle(fontSize: 14.sp,color: AppColors.kPrimaryColor,),)
                   ],)),
           ),
          
         
        Padding(
          padding:  EdgeInsets.only(left: 160.w),
          child: ButtonWidget(title: 'Create Ticket',textColor:AppColors.kGrayLight2Color , onPress: (){},icon: Icons.add,width: 140.w,buttonicon: Icons.add,),
        )
        
        
            ]),
      ));
  }
}

class icons_textfield extends StatelessWidget {
  final IconData? icon;
  final String? hinttext;
  final Color? color;
  const icons_textfield({
    super.key,
    this.color,
    this.hinttext,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:39.h ,
      width:280.w ,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrayDarkColor),
        borderRadius:BorderRadius.circular(7),
    
      ),
      child: 
       TextFormField(
            decoration: InputDecoration(
              prefixIcon:Icon(icon,color: color,),
              
            //  suffixIcon: Icon(Icons.flag,color: AppColors.kTertiaryColor,),
              hintText: hinttext,
              border: InputBorder.none,
          ),
          ),
    );
  }
}

// ignore: camel_case_types
class button extends StatelessWidget {
 final IconData? icon;
 final Color? buttonColor;
 final String title;
 final String image;
 final Color? textColor;
 
 
  const button({
    super.key,
    this.textColor,
  required this.image,
    this.buttonColor,
   required this.title,
    this.icon
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 30.h,
        width: 92.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(7.r),
          color:buttonColor,
      
        ),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 4.w),
              child: Container(height: 16,width: 15,
                child: Image(image: AssetImage(image),fit: BoxFit.cover,))
            ),
            Text(title,style: TextStyle(color: textColor,fontSize: 14.sp),)
          ],
        ),
        
      ),
    );
  }
}

// ignore: camel_case_types
class textfield extends StatelessWidget {
  const textfield({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(height:39.h ,width: 374.w,
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.kGrayDarkColor)
      ),
       child: TextField(
        decoration: InputDecoration(
    border: InputBorder.none,
      ),
      ),
      ),
    );
  }
}