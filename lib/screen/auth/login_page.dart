import 'dart:convert';
import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/custom_button.dart';
import 'package:baca_buku_app1/components/custom_textfield.dart';
import 'package:baca_buku_app1/screen/auth/forgot_password.dart';
import 'package:baca_buku_app1/screen/auth/register_page.dart';
import 'package:baca_buku_app1/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/login'),
      body: {
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
        MaterialPageRoute(builder: (context) => Navbar()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login to your account.",
                    style: GoogleFonts.poppins(
                        color: CustomColor.first,
                        fontWeight: FontWeight.w600,
                        fontSize: mediaQuery.width * .048),
                  ),
                  SizedBox(
                    height: mediaQuery.width * .09,
                  ),
                  CustomTextField(text: "Email", icon: Icons.mail_outlined, controller: _emailController),
                  SizedBox(
                    height: mediaQuery.width * .07,
                  ),
                  CustomPasswordTextField(
                    text: "Password",
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: mediaQuery.width * .01,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomClickableText(
                          text: "Forgot Password?",
                          textColor: CustomColor.third,
                          onTap: () {
                            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage()));
                          },
                          fontSize: mediaQuery.width * .04)),
                  SizedBox(height: mediaQuery.width / 5),
                  CustomButton(
                      buttonText: "Login",
                      onPressed: _login,
                      buttonColor: CustomColor.first,
                      buttonSize: mediaQuery.height,
                      fontSize: mediaQuery.width * .06),
                  SizedBox(
                    height: mediaQuery.width * .01,
                  ),
                  const UnderButtonText(),
                  SizedBox(
                    height: mediaQuery.width * .06,
                  ),
                  const DividerWithText(text: "Or login with"),
                  SizedBox(
                    height: mediaQuery.width * .06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnotherLoginButton(image: "", onTap: () {}),
                      AnotherLoginButton(image: "", onTap: () {})
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.width * .03,
                  ),
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
        Text("Didn't have an account?",
            style: GoogleFonts.poppins(
                color: CustomColor.first,
                fontSize: mediaQuery.width * .04,
                fontWeight: FontWeight.w500)),
        SizedBox(width: mediaQuery.width * .01),
        CustomClickableText(
            text: "Sign Up",
            textColor: CustomColor.third,
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            },
            fontSize: mediaQuery.width * .04)
      ],
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: mediaQuery.width * .04, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}