import 'package:flutter/material.dart';
import 'package:movies_login/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/images/play.png"),



            _buildTextField('Email', Icons.email),
            _buildTextField('Password', Icons.lock, isPassword: true),

            SizedBox(height: 10),

            SizedBox(height: 10),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password ?",
                style: TextStyle(color: Color(0xffF6BD00)),
              ),
            ),
            SizedBox(height: 20),

            // Login Button
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
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),


            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have Account?",style: TextStyle(color: Colors.white),),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                }, child: Text("Create One",style: TextStyle(color: Color(0xffF6BD00), fontWeight: FontWeight.bold),)),
              ],),



            SizedBox(height: 20),

            // OR Divider
            Row(
              children: [
                Expanded(child: Divider(color: Color(0xffF6BD00))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("OR", style: TextStyle(color: Color(0xffF6BD00))),
                ),
                Expanded(child: Divider(color: Color(0xffF6BD00))),
              ],
            ),
            SizedBox(height: 20),

            // Google Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF6BD00),
                  //backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.g_mobiledata_outlined, color: Colors.black),
                label: Text(
                  "Login With Google",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),


            SizedBox(height: 20),

            // Language Selector (Flag Images)
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
          ],
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