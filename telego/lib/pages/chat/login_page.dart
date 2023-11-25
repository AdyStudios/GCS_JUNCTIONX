import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telego/components/m_button.dart';
import 'package:telego/components/m_text_filed.dart';
import 'package:telego/services/auth/auth_service.dart';
import 'package:telego/Variables.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try{
      await authService.signInWithEmailandPassword(emailController.text, passwordController.text);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline_rounded,
                size:80,
              ),
              const SizedBox(height: 25),
              Text("Experience true freedom!", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: button_text_color)),
              const SizedBox(height: 50),
              MyTextField(controller: emailController, hintText: 'Phone Number', obscureText: false),
              const SizedBox(height: 10),
              MyTextField(controller: passwordController, hintText: 'Password', obscureText: true),
              const SizedBox(height: 25),
              MyButton(onTap: signIn, text: "Sign In"),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Not a member?', style: TextStyle(color: button_text_color)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Register Now', 
                    style: 
                    TextStyle(
                      color: button_text_color,
                      fontWeight: 
                      FontWeight.bold
                      ),
                  ),
                ),
            ])
            ],
          ),
        ),
      )
    );
  }
}