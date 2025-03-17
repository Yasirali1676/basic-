import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/Smit/chatapp/views/Auth/login.dart';
import 'package:dashboard/Trenzym/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        print('image-------------->$_selectedImage');
      });
    }
  }



  Future<void> saveUserDetailsToFirestore(String uid, String? imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('myUsers').doc(uid).set({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
         'password': passwordController.text.trim(),
        'profileImage': imageUrl,
        'createdAt': DateTime.now(),
        'uid': uid,
      });


      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (error) {
      print(
          'Error User details saved successfully saving user details--------: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save user details: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',style: TextStyle(color: AppColors.kBackgroundColor),),backgroundColor: const Color.fromARGB(129, 100, 255, 219),
      ),
      backgroundColor: Colors.teal,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [

            GestureDetector(
            onTap: _pickImage,
            child: _selectedImage == null
                ? Icon(
              Icons.add_a_photo,
              size: 80,
              color: Colors.grey,
            )
                : CircleAvatar(
              radius: 80,
              backgroundImage: FileImage(_selectedImage!),
            ),
          ),
  Padding(
                   padding: const EdgeInsets.only(top: 20),
                   child: Image.asset(
                               'asset/image/slide1.png', 
                               height: 180,
                               width: 320,
                               fit: BoxFit.cover, 
                             ),
                 ),


              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'first name',
                    
                   border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'last name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password!';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                             fixedSize: Size(190, 45), 
                      // Width: 200, Height: 50
                    ),
                    onPressed: () async {
                      
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          print('User creation successful and my id -----------> ${userCredential.user!.uid}');
                       
                          await saveUserDetailsToFirestore(
                              userCredential.user!.uid, '');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account created successfully!'),
                            ),
                          );
                        //  Navigate to Login Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (error) {
                          print('error---------->$error');
                  
                        } catch (error) {
                          print('Error during sign up: $error');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $error')),
                          );
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.teal,
                          )
                        : const Text('Sign Up',style: TextStyle(color: Colors.teal,fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Center(child: Text('Already have account',style: TextStyle(color: Colors.black,fontSize: 12, ),)),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Text('login',style: TextStyle(color: Colors.green,fontSize: 18, fontWeight: FontWeight.bold),)),
                )),
              ],),
              
                SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

}