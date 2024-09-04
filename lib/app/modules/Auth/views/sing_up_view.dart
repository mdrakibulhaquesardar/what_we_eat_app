import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/modules/Auth/controllers/auth_controller.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/app/utils/PrimaryFormFilde.dart';

class SingUpView extends GetView {
  const SingUpView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Form(
      key: controller.formKeySignUp,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ).paddingTop(MediaQuery
                          .of(context)
                          .size
                          .height * 0.1),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'What We Eat',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )).paddingTop(20),
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please sign up A new account And ',

                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Colors.black,
                            ),

                          ),
                          TextSpan(
                            text: 'Enjoy our services',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Colors.green,

                            ),
                          ),

                        ],
                      )),

                      const Divider(
                        thickness: 0.5,
                      ).paddingOnly(top: 20, bottom: 20),


                      PrimaryFormFilde(
                        label: 'Full Name',
                        hint: 'Enter your full name',
                        icon: FontAwesomeIcons.user,
                        keyboardType: TextInputType.name,
                        controller: controller.nameControllerSignUp,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          if(value.length < 3)
                            {
                              return 'Full name must be at least 3 characters long';
                            }
                          return null;
                        },
                      ),

                      PrimaryFormFilde(
                        label: 'Email',
                        hint: 'Enter your email',
                        icon: FontAwesomeIcons.envelope,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailControllerSignUp,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.isEmail) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },


                      ).paddingTop(20),


                      PrimaryFormFilde(
                        label: 'Password',
                        hint: 'Enter your password',
                        icon: FontAwesomeIcons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: controller.passwordControllerSignUp,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if(value.length < 6)
                          {
                            return 'Password must be at least 6 characters long';
                          }
                          if(value.isNumericOnly)
                          {
                            return 'Password must contain at least one letter';
                          }
                          if(value.isAlphabetOnly)
                          {
                            return 'Password must contain at least one number';
                          }
                          return null;
                        },
                      ).paddingTop(20),


                      Obx(() {
                        return ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: controller.isLogin.value
                              ? null
                              : () {
                            controller.signUp();
                          },
                          child: controller.isLogin.value
                              ? LoadingAnimationWidget.inkDrop(
                              color: Colors.white, size: 20)
                              : Text(
                              'Registration', style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                        );
                      }).paddingTop(20),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Sign in',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }


}
