import 'dart:io';
import 'package:dashboard/Smit/chatapp/views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart' as lottie;
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
   String _address = "No Address Added"; 
  File? _image;
  String _name = "John Doe"; 
  String _email = "johndoe@gmail.com";

  @override
  void initState() {
    super.initState();
    loadProfileData();
       loadAddress();
    Accountdetails();
  }
  //Account details
   Future<void> Accountdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "Account I nformation";
      _email = prefs.getString('email') ?? "Account I nformation";

    });
  }
  //account details diolage
  
//add edress
  // Load saved address from SharedPreferences
  Future<void> loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _address = prefs.getString('user_address') ?? "No Address Added";
    });
  }

  // Save address to SharedPreferences
  Future<void> saveAddress(String newAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_address', newAddress);
    setState(() {
      _address = newAddress;
    });
  }
  //account details diolage
    void showAccountDetailsDialog() {
  TextEditingController nameController = TextEditingController(text: _name);
  TextEditingController emailController = TextEditingController(text: _email);
  TextEditingController addressController = TextEditingController(text: _address);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Account Details"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             
              GestureDetector(
                onTap: _showImagePickerOptions,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: _image != null 
                    ? FileImage(_image!) 
                    : AssetImage("assets/profile_placeholder.png") as ImageProvider,
                ),
              ),
              SizedBox(height: 10),

              
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),

            
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),

              // Address Input
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: "Address"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              setState(() {
                _name = nameController.text;
                _email = emailController.text;
                _address = addressController.text;
              });

              //  SharedPreferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('name', _name);
              await prefs.setString('email', _email);
              await prefs.setString('user_address', _address);

              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}

 // Show Dialog to Enter Address
  void showAddressDialog() {
    TextEditingController addressController = TextEditingController(text: _address);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Your Address"),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Enter your address here"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                saveAddress(addressController.text);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }


  
  

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "John Doe";
      _email = prefs.getString('email') ?? "johndoe@gmail.com";
      String? imagePath = prefs.getString('image');
      if (imagePath != null) _image = File(imagePath);
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('image', pickedFile.path);
    }
  }

  Future<void> _editProfile() async {
    TextEditingController nameController = TextEditingController(text: _name);
    TextEditingController emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
              TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            ],
          ),
          actions: [
              TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel')),
            TextButton(
              onPressed: () async {
                setState(() {
                  _name = nameController.text;
                  _email = emailController.text;
                });
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', _name);
                await prefs.setString('email', _email);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          
          ],
        );
      },
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take Photo"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Choose from Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _showImagePickerOptions,
              child: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, top: 60),
                  child: Container(
                    height: 40,width: 50,
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.camera_alt_outlined)),
                ),foregroundColor: const Color.fromARGB(188, 96, 125, 139),
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : AssetImage("assets/profile_placeholder.png") as ImageProvider,
              ),
            ),
            SizedBox(height: 10),
            Text(_name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(_email, style: TextStyle(fontSize: 14, color: Colors.grey)),
            Icon(Icons.verified, color: Colors.green, size: 16),
            ]),
            SizedBox(height: 10),
            Divider(thickness: 4,),
           
              SizedBox(height: 40),           
            
          
            InkWell(onTap: () {
              _editProfile();
            },
              child: ListTile(leading: Container(height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(73, 0, 150, 135),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.fact_check)), title: Text("Edite Profile"),trailing: Icon(Icons.arrow_forward_ios_outlined),),
            ),
              Divider(),
               InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
               },
                 child: ListTile(leading: Container(height: 40,
                               width: 40,
                               margin: EdgeInsets.symmetric(horizontal: 20),
                               decoration: BoxDecoration(
                  color: const Color.fromARGB(73, 0, 150, 135),
                  borderRadius: BorderRadius.circular(10)
                               ),
                               child: Icon(Icons.logout)), title: Text("Logout"),trailing: Icon(Icons.arrow_forward_ios_outlined),),
               ),
        Divider(),
        ListTile(
              leading: Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(73, 0, 150, 135),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.home),
              ),
              title: Text("Address"),
              subtitle: Text(_address, style: TextStyle(color: Colors.grey)),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: showAddressDialog,
            ),
              Divider(),
          InkWell(
            onTap: (){
                showAccountDetailsDialog();
            },
            child: ListTile(leading: Container(height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(73, 0, 150, 135),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.dataset_sharp)), title: Text("Account Details"),trailing: Icon(Icons.arrow_forward_ios_outlined),),
          ),
              Divider(),
          InkWell(
            onTap: () {
            
            },
            child: ListTile(leading: Container(height: 40,
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(73, 0, 150, 135),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.delete_outlined)), title: Text("Delete"),trailing: Icon(Icons.arrow_forward_ios_outlined),),
          ),
          ],
        ),
      ),
    );
  }
   
}

   