import 'package:dashboard/main.dart';
import 'package:dashboard/supplier/widget/text_fromfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({super.key});

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
    TextEditingController Companycontroller =TextEditingController();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController addrescontroller =TextEditingController();
  TextEditingController numbercontroller =TextEditingController();
   Map<String, String> dataMap = {};
   void savedata() {
    String userInput = namecontroller.text;
    String companyinput = Companycontroller.text;
     String
      Phoneinput = numbercontroller.text;
      String Adressinput = addrescontroller.text;
     if (userInput.isNotEmpty) {
      setState(() {
        dataMap['Name'] = userInput;
         dataMap['Company'] = companyinput;
         dataMap['Phone num']= Phoneinput;
         dataMap['Adress']= Adressinput;
      });

      debugPrint('Updated Map: $dataMap');
    }
     namecontroller.clear();
    }
  
   Future<void> loginShow(BuildContext context)async{
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
              width: 240.w,
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
                       child: Center(child: Text('cancle ',style: TextStyle(color: Colors.white,fontSize: 15 ,fontWeight: FontWeight.bold),)),
                     ),
                   ),
                  //
                  SizedBox(width: 10.h,),
                   GestureDetector(
                     onTap: (){
              savedata();
               
                      // print(namecontroller.text);
                      // print(Companycontroller.text);
                      //  print(numbercontroller.text);
                      //   print(addrescontroller.text);
               
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
             ]
             ,
           ),
         );
        });
  }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     namecontroller.dispose();
//     Companycontroller.dispose();
//     numbercontroller.dispose();
//     addrescontroller.dispose();
//     super.dispose();
//   }
  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(builder: (context,value,child){

    
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF6C63FF),
        title: Center(child: Text('Add info',style: TextStyle(color: Colors.white),)),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF8BB7F0),
        onPressed: (){
      loginShow(context);
      
      },
      child: Icon(Icons.add),
      ),
      );
  });
  }
  
}