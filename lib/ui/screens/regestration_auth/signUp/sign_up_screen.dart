import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/ui/custom_widgets/custom_button.dart';
import 'package:antonx/ui/custom_widgets/custom_icon_container.dart';
import 'package:antonx/ui/custom_widgets/custom_image_container_reg.dart';
import 'package:antonx/ui/screens/dashboard/Dashboard.dart';
import 'package:antonx/ui/screens/regestration_auth/login/login_screen.dart';
import 'package:antonx/ui/screens/regestration_auth/signUp/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/text_style.dart';
import '../../../custom_widgets/input_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width / 1.4,
                  right: 0,
                  top: MediaQuery.of(context).size.height / 8,
                  child: CustomImageContainer(
                    image: "assets/leaf2.png",
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 70,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: CustomIconConatiner(
                      iconColor: mainColor,
                      icon: Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 100, 30, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        const Center(
                            child: Text(
                          "Register",
                          style: headingTextStyle,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                            child: Text(
                          "Create your new account",
                          style: subheadingTextStyle,
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        InputTextFormField(
                            hintText: "Full Name",
                            controller: TextEditingController(
                                text: model.appUsers.name),
                            obsecuretext: false,
                            validator: (String val) {
                              if (val == null || val.length < 1) {
                                return "please enter your full name";
                              } else
                                return null;
                            },
                            onchanged: (val) {
                              model.appUsers.name = val;
                            },
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 18,
                              color: mainColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        InputTextFormField(
                            hintText: "jhonsmith@gmail.com",
                            controller: TextEditingController(
                                text: model.appUsers.email),
                            validator: (String val) {
                              if (val == null ||
                                  !val.toString().contains("@")) {
                                return "please enter a valid email address";
                              } else
                                return null;
                            },
                            onchanged: (val) {
                              model.appUsers.email = val;
                            },
                            obsecuretext: false,
                            prefixIcon: const Icon(
                              Icons.mail,
                              size: 18,
                              color: mainColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        InputTextFormField(
                            hintText: "Password",
                            controller: TextEditingController(
                                text: model.appUsers.password),
                            validator: (String val) {
                              if (val == null || val.length < 6) {
                                return "Min Pass length is 6 character";
                              } else
                                return null;
                            },
                            onchanged: (val) {
                              model.appUsers.password = val;
                            },
                            obsecuretext: true,
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 18,
                              color: mainColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        InputTextFormField(
                            hintText: "Confirm Password",
                            controller: TextEditingController(
                                text: model.appUsers.password),
                            validator: (String val) {
                              if (val == null ||
                                  val != model.appUsers.password) {
                                return "your passwords are not matching";
                              }
                              return null;
                            },
                            obsecuretext: true,
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 18,
                              color: mainColor,
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: RichText(
                            text: const TextSpan(
                              //text: '',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'By signing you agree to our ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Terms of use ',
                                ),
                                TextSpan(
                                    text: '\n and ',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'privacy policy ',
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(height: 200,),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                    right: 30,
                    bottom: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                          CustomButton(
                            text: "Sign Up",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                model.signup();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                style: const TextStyle(
                                  color: blackColor,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: 'LogIn ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.to(LoginScreen()),
                                    style: const TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
