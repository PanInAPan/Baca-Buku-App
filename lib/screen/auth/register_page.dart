import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/custom_button.dart';
import 'package:baca_buku_app1/components/custom_textfield.dart';
import 'package:baca_buku_app1/screen/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/register'),
      body: {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.first,
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(35, 45, 35, 0),
            width: mediaQuery.width,
            height: mediaQuery.height / 1.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create your new account.",
                    style: GoogleFonts.poppins(
                        color: CustomColor.first,
                        fontWeight: FontWeight.w600,
                        fontSize: mediaQuery.width * .048),
                  ),
                  SizedBox(
                    height: mediaQuery.width * .09,
                  ),
                  CustomTextField(text: "Username", icon: Icons.person_outline, controller: _nameController,),
                  SizedBox(
                    height: mediaQuery.width * .07,
                  ),
                  CustomTextField(text: "Email", icon: Icons.mail_outlined, controller: _emailController,),
                  SizedBox(
                    height: mediaQuery.width * .07,
                  ),
                  CustomPasswordTextField(
                    text: "Password",
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: mediaQuery.width * .07,
                  ),
                  SizedBox(height: mediaQuery.width / 6),
                  CustomButton(
                      buttonText: "Register",
                      onPressed: _register,
                      buttonColor: CustomColor.first,
                      buttonSize: mediaQuery.height,
                      fontSize: mediaQuery.width * .06),
                  SizedBox(
                    height: mediaQuery.width * .01,
                  ),
                  const UnderButtonText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UnderButtonText extends StatelessWidget {
  const UnderButtonText({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",
            style: GoogleFonts.poppins(
                color: CustomColor.first,
                fontSize: mediaQuery.width * .04,
                fontWeight: FontWeight.w500)),
        SizedBox(width: mediaQuery.width * .01),
        CustomClickableText(
            text: "Login",
            textColor: CustomColor.third,
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  LoginPage()));
            },
            fontSize: mediaQuery.width * .04)
      ],
    );
  }
}
