
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class category extends StatelessWidget {
  final String? image1; 
   
  final String title;
  final String button_title;
  final double padding;
  final double? width;
  
  
  const category({super.key,
  
this.image1,
 this.width,
required this.title,
required this.padding,
required this.button_title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 400.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,),
        color: Colors.white
      ),
    child: Row(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 7.w),
          child: Container(height: 20.h,
          width: 20.w,
          //child:Image(image: AssetImage(image1.toString()))
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 5.w),
          child: Container(height: 20.h,
          width: 20.w,
          child: Image(image: AssetImage('asset/row2.png')),
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(title,style: TextStyle(fontSize: 18.sp),),
        ),

      
          /////button
           Padding(
             padding: EdgeInsets.only(left: padding ),
             child: Container(
                   height: 39.h,
                   width:width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.grey,width: 1.w,),
             color: const Color.fromARGB(207, 255, 255, 255)
                   ),
                   child: Center(child: Text(title,style: TextStyle(fontSize: 18.sp),)),
                 ),
           )
        ,
     
      Padding(
          padding:  EdgeInsets.only(left: 25.w),
          child: Container(height: 25.h,
          width: 25.w,
          child: Image(image: AssetImage(image1.toString())),
          ),
        ),
      ],
    ),
    );
  }
}