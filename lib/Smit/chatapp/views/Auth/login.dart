
import 'package:dashboard/Smit/chatapp/views/Auth/singin.dart';
import 'package:dashboard/Smit/chatapp/views/chathome/bottombar.dart';
import 'package:dashboard/Smit/chatapp/views/chathome/personlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error = '';
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(129, 100, 255, 219),
        title: Text('Login', style: TextStyle(color: Colors.white,fontSize: 22)),
      ),
     backgroundColor: Colors.teal,
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 20),
                   child: Image.asset(
                               'asset/image/slide2.png', // Replace with your image URL
                               height: 180,
                               width: 320,
                               fit: BoxFit.cover, // Adjusts how the image is displayed
                             ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'email',
                      
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your email!!';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password!!';
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 70,),
                ElevatedButton(
                         style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                             fixedSize: Size(190, 45), 
    // Width: 200, Height: 50
  ),
                    onPressed: () async {
                 
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                          error = '';
                        });
            
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
            
                          // Check if user exists
                          if (userCredential.user != null) {
                            print('user id -------> ${userCredential.user!.uid}');
            
                            // User exists, show message and don't navigate
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('User already exists!')),
                            );
            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => bottombar()),
                            );
            
                          } else {
                            // Navigate to HomeScreen if user does not exist
            
                          }
            
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Login successfully!!')));
                        } on FirebaseException catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${error.message}')));
                          print('error------>$error');
                          setState(() {
                            loading = false;
                          });
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                    child: loading ? CircularProgressIndicator(color: Colors.teal,) : Text('Login')),
                    SizedBox(height: 10,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Center(child: Text('Resister Now',style: TextStyle(color: Colors.black,fontSize: 12, ),)),
                Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    },
                    child: Text('Sign up',style: TextStyle(color: Colors.green,fontSize: 18, fontWeight: FontWeight.bold),)),
                )),
              ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}