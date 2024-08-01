import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/custom_button.dart';
import 'package:baca_buku_app1/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor.first),
        toolbarHeight: mediaQuery.width / 5,
        title: Text("New Password",
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
                  "Your password must be different from previously used password.",
                  style: GoogleFonts.poppins(
                      color: CustomColor.first,
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width / 22)),
              SizedBox(
                height: mediaQuery.width * .1,
              ),
              CustomPasswordTextField(text: "Password", controller: _passwordController,),
              SizedBox(
                height: mediaQuery.width * .09,
              ),
              CustomPasswordTextField(text: "Confirm Password", controller: _confirmPasswordController,),
              SizedBox(
                height: mediaQuery.width * .2,
              ),
              CustomButton(
                  buttonText: "Verify",
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
