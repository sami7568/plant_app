import 'package:antonx/core/constants/Strings.dart';
import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/ui/custom_widgets/custom_button.dart';
import 'package:antonx/ui/custom_widgets/custom_image_container_reg.dart';
import 'package:antonx/ui/screens/regestration_auth/forgot_pass/forgot_password_screen.dart';
import 'package:antonx/ui/screens/regestration_auth/login/login_view_model.dart';
import 'package:antonx/ui/screens/regestration_auth/signUp/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/text_style.dart';
import '../../../custom_widgets/input_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context,model,child){
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width/1.4,
                right: 0,
                top: MediaQuery.of(context).size.height/2.6,
                child: CustomImageContainer(image: "assets/leaf2.png",),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height/2.7,
                    decoration: const BoxDecoration(
                        //color: mainColor,
                      image: DecorationImage(image: AssetImage("assets/leaves.jpeg"),fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 60,
                child: GestureDetector(
                  onTap: (){
                    print("@this is click");
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),),
                    child: const Icon(Icons.arrow_back_ios_rounded,size: 25,color: mainColor,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 290, 30, 10),
                child: Form(
                  key:formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80,),
                       Center(child: Text(Strings().welcomBack,style: headingTextStyle,)),
                      const SizedBox(height: 13,),
                       Center(child: Text(Strings().loginToyourAccount,style: subheadingTextStyle,)),
                      const SizedBox(height: 40,),
                      InputTextFormField(
                          hintText: Strings().hintfullname,
                          controller: TextEditingController(text: model.user.name),
                          obsecuretext: false,validator: (String value){
                            if (value == null||value.length < 1) {
                              return "Please enter full name";
                            }  else
                              return null;
                      },
                          onchanged: (value){
                            model.user.name = value;
                      },
                          prefixIcon: const Icon(Icons.person,size: 18,color: mainColor,)
                      ),
                      const SizedBox(height: 15,),
                      InputTextFormField(
                          hintText:  Strings().hintPass, controller: TextEditingController(text: model.user.password),
                          obsecuretext: true,validator: (String val){
                            if (val==null||val.length<6) {
                              return "Min password length is 6 character";
                            } else {
                              return null;
                            }
                      },
                          onchanged: (value){
                            model.user.password=value;
                          },
                          prefixIcon: const Icon(Icons.lock,size: 18,color: mainColor,)),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  shape: const CircleBorder(),
                                  checkColor: Colors.white,
                                  activeColor: mainColor,
                                  value: model.checkremeber,
                                  onChanged: (value){
                                model.setCheckboxValue(value!);
                              }),
                              Text( Strings().remeberMe,style: mainTextStyle),
                            ],
                          ),
                          GestureDetector(
                              onTap: (){
                                Get.to(ForgotPassword());
                              },
                              child: Text( Strings().forgotPassword,style: mainTextStyle)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                right:30,
                bottom:20,
                child: Column(
                  children: [
                    CustomButton(text:  Strings().login,onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        model.loginWithNameAndPass();
                      }
                    },),
                    const SizedBox(height: 20,),
                    Center(
                      child: RichText(
                        text:  TextSpan(
                          text: '',
                          style:  const TextStyle(color: blackColor,),
                          children: <TextSpan>[
                            TextSpan(text:  Strings().donthaveaccount,style: const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold)),
                            TextSpan(
                              recognizer: new TapGestureRecognizer()..onTap = () => Get.to(SignUpScreen()),
                              text:  Strings().signup, style: const TextStyle(color: mainColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-55.0);
    var p1 = Offset(size.width/4, size.height);
    var p2  = Offset(size.width-0.04,size.height-90.0);

    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width,0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
