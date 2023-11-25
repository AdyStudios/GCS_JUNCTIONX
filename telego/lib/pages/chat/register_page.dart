import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telego/components/m_button.dart';
import 'package:telego/components/m_text_filed.dart';
import 'package:telego/services/auth/auth_service.dart';


class RegisterPage extends StatefulWidget{
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  void signUp() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    
    try{
      await authService.signUpWithEmailandPassword(emailController.text, usernameController.text, passwordController.text);
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    /*authService.phoneAuthentication(phoneNumController.text.trim());*/

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message, 
                size:80,
              ),
              const SizedBox(height: 25),
              Text("Let's create an account for \nYou!", style: TextStyle( fontSize: 16)),
              const SizedBox(height: 50),
              MyTextField(controller: emailController, hintText: 'Phone Number', obscureText: false),
              MyTextField(controller: usernameController, hintText: 'Username', obscureText: false),
              MyTextField(controller: passwordController, hintText: 'Password', obscureText: false),
              const SizedBox(height: 25),
              MyButton(onTap: signUp, text: "Register Now"),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Already a member?'),
                SizedBox(width: 4),
                GestureDetector(onTap: widget.onTap, child: Text('Sign In Now', style: TextStyle(fontWeight: FontWeight.bold),)),
            ])
            ],
          ),
        ),
      )
    );
  }
}