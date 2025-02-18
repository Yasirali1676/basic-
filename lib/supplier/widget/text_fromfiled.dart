
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class TextEmailField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? prefixImagePath; // New parameter for asset image path
  const TextEmailField({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
    this.prefixImagePath, // Initialize it here
  });
  @override
  State<TextEmailField> createState() => _TextEmailFieldState();
}
class _TextEmailFieldState extends State<TextEmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff3B6985),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Grey border color
            width: 2.0,// Border thickness
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Grey border for enabled state
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Grey border when focused
            width: 2,
          ),
        ),
        prefixIcon: widget.prefixImagePath != null
            ? Padding(
          padding:  EdgeInsets.all(12.0.sp),
          child: Image.asset(widget.prefixImagePath!, scale: 4.5),
        )
            : null, // Asset image as prefix
        contentPadding: EdgeInsets.all(16.sp), // Padding inside the TextField
        hintText: widget.title, // Hint text
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}