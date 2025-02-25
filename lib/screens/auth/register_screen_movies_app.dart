import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName='register_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffF6BD00)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Register',
          style: TextStyle(color: Color(0xffF6BD00), fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/images/gamer_one.png"),
                  Image.asset("assets/images/gamer_two.png"),
                  Image.asset("assets/images/gamer_three.png"),
                ],),

              const SizedBox(height: 20),
              _buildTextField('Name', Icons.person),
              _buildTextField('Email', Icons.email),
              _buildTextField('Password', Icons.lock, isPassword: true),
              _buildTextField('Confirm Password', Icons.lock, isPassword: true),
              _buildTextField('Phone Number', Icons.phone),
              const SizedBox(height: 20),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xffF6BD00),
              //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
              //   ),
              //   onPressed: () {},
              //   child: const Text(
              //     'Create Account',
              //     style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              // ),
              //

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffF6BD00),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Create Account",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already Have Account ? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Login',style: TextStyle(color: Color(0xffF6BD00), fontWeight: FontWeight.bold)),),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: const Text(
                  //     'Login',
                  //     style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),


              Container(
                width: 100,
                height: 50,
                padding: EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  border: Border.all(width:3,color: Color(0xffF6BD00)),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/usa.png", width: 30),width: 50,decoration: BoxDecoration(borderRadius :BorderRadius.circular(25),color: Color(0xffF6BD00),),),
                    Spacer(),
                    Image.asset("assets/images/egypt.png", width: 30),
                  ],
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('assets/images/usa.png', width: 40),
              //     const SizedBox(width: 10),
              //     Image.asset('assets/images/egypt.png', width: 40),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(icon, color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

}
