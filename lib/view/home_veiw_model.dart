import 'package:dashboard/supplier/widget/text_fromfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogProvider extends ChangeNotifier {
  
  TextEditingController Companycontroller =TextEditingController();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController addrescontroller =TextEditingController();
  TextEditingController numbercontroller =TextEditingController();

  
  
     Future<void> name (BuildContext context)async{
    return showDialog(context: context,
        builder: (context){
         return SingleChildScrollView(
           child: AlertDialog(
            
             title:Column(children: [
             Padding(
               padding:  EdgeInsets.only(right: 30.h),
               child: Text('Add Your Info',style: TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF8BB7F0),fontSize: 30,fontStyle: FontStyle.italic ),),
             ),
              Padding(
                padding:  EdgeInsets.only(top: 50.h),
                child: Container(width: 240.w,
                   child: 
                   TextEmailField(title: 'name', controller: namecontroller)
                    ),
              ),
             ],),
            
             content:Container(
              width: 400.w,
              height: 300.h,
               child: Column(children: [
                TextEmailField(title: 'company name', controller:Companycontroller ),
                  
                  
                      Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: Container(width: 240.w,
                                       child: 
                                       TextEmailField(title: 'Phone number', controller: numbercontroller,keyboardType: TextInputType.number,)
                                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: Container(width: 240.w,
                                       child: TextEmailField(title: 'Adress', controller: addrescontroller,)
                                        ),
                      ),
                  
                  ],),
             ),
             //  mainAxisAlignment: MainAxisAlignment.center,
               
             actions: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end ,
                 children: [
                  GestureDetector(
                     onTap: (){
                     //  Navigator.push(context, MaterialPageRoute(builder: (context) => home2()));
                       Navigator.pop(context);
                     },
                     child: Container(
                       height: 35.h,
                       width: 80.w,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color:Color(0xFF8BB7F0),
                       ),
                       child: Center(child: Text('cancle',style: TextStyle(color: Colors.white,fontSize: 15 ,fontWeight: FontWeight.bold),)),
                     ),
                   ),
                  //
                  SizedBox(width: 10.h,),
                   GestureDetector(
                     onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                       Navigator.pop(context);
                     },
                     child: Container(
                       height: 35.h,
                       width: 80,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Color(0xFF8BB7F0),
                       ),
                       child: Center(child: Text('save',style: TextStyle(color: Colors.white,fontSize: 15 ,fontWeight: FontWeight.bold),)),
                     ),
                   ),
                 ],
               )
               /*ElevatedButton(onPressed: (){
                 Navigator.pop(context);
               }, child: Text('NO')),*/
             ]
             ,
           ),
         );
        });
  }

  }
  
