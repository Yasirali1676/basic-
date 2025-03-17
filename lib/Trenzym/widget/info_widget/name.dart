import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class name extends StatelessWidget {
  
  final String title;
  const name({super.key,

required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        height: 56.h,
        width: 410.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,),
          color: Colors.white
        ),
      child: Row(
        children: [
        
          Padding(
            padding:  EdgeInsets.only(left: 30.w),
            child: Container(height: 20.h,
            width: 20.w,
            child: Image(image: AssetImage('asset/row1.png')),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text('NAME',style: TextStyle(fontSize: 18.sp),),
          ),
      
        Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Padding(
             padding: EdgeInsets.only(left: 0 ),
             child: Container(
                   height: 39.h,
                   width:111,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.grey,width: 1.w,),
             color: const Color.fromARGB(207, 255, 255, 255)
                   ),
                   child: Center(child: Text(title,style: TextStyle(fontSize: 18.sp),)),
                 ),
           )
        ,
          ),
          Text('#4',style: TextStyle(fontSize: 17,color: Colors.grey),),
          
       
        ],
      ),
      ),
    );
  }
}