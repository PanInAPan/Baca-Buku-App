import 'package:baca_buku_app1/common/color.dart';
import 'package:baca_buku_app1/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColor.first),
        toolbarHeight: mediaQuery.width / 5,
        title: Text("Check your emaijl",
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
                  "Enter the code we sent to :\np****@gmail.com",
                  style: GoogleFonts.poppins(
                      color: CustomColor.first,
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width / 22)),
              SizedBox(
                height: mediaQuery.width * .2,
              ),
              Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,            
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: CustomColor.third)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              borderSide: BorderSide(
                                  color: CustomColor.first,
                                  width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                    color: CustomColor.first,
                                    width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: CustomColor.third)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              borderSide: BorderSide(
                                  color: CustomColor.first,
                                  width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                    color: CustomColor.first,
                                    width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: CustomColor.third)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              borderSide: BorderSide(
                                  color: CustomColor.first,
                                  width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                    color: CustomColor.first,
                                    width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: CustomColor.third)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                              borderSide: BorderSide(
                                  color: CustomColor.first,
                                  width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                borderSide: BorderSide(
                                    color: CustomColor.first,
                                    width: 2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
