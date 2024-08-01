import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/custom_button.dart';
import 'package:baca_buku_app1/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor.first),
        toolbarHeight: mediaQuery.width / 5,
        title: Text("Forgot Password",
            style: GoogleFonts.poppins(
                color: CustomColor.first,
                fontWeight: FontWeight.bold,
                fontSize: mediaQuery.width / 16)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: mediaQuery.width * .600,
                decoration: BoxDecoration(
                    color: CustomColor.first, shape: BoxShape.circle),
              ),
              SizedBox(
                height: mediaQuery.width * .09,
              ),
              Text(
                  "Enter the email associated with your account and we will email you a code to recover your password.",
                  style: GoogleFonts.poppins(
                      color: CustomColor.first,
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width / 22)),
              SizedBox(
                height: mediaQuery.width * .2,
              ),
              CustomTextField(text: "Email", icon: Icons.email_outlined, controller: _emailController,),
              SizedBox(
                height: mediaQuery.width * .2,
              ),
              CustomButton(
                  buttonText: "Send",
                  onPressed: () {},
                  buttonColor: CustomColor.first,
                  buttonSize: mediaQuery.height,
                  fontSize: mediaQuery.width * .06)
            ],
          ),
        ),
      ),
    );
  }
}
