import 'package:dashboard/supplier/widget/text_fromfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController companyController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // Show Dialog Function
  Future<void> showNameDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30.h),
                  child: Text(
                    'Add Your Info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8BB7F0),
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: SizedBox(
                    width: 240.w,
                    child: TextEmailField(
                      title: 'Name',
                      controller: nameController,
                    ),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: 400.w,
              height: 300.h,
              child: Column(
                children: [
                  TextEmailField(
                    title: 'Company Name',
                    controller: companyController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: SizedBox(
                      width: 240.w,
                      child: TextEmailField(
                        title: 'Phone Number',
                        controller: numberController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: SizedBox(
                      width: 240.w,
                      child: TextEmailField(
                        title: 'Address',
                        controller: addressController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF8BB7F0),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF8BB7F0),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Dispose Controllers to Prevent Memory Leaks
  @override
  void dispose() {
    companyController.dispose();
    nameController.dispose();
    addressController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
