import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/app/utils/PrimaryFormFilde.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
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
                        'Sign In',
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
                            text: 'Please sign in to continue And ',

                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: Colors.black,
                            ),

                          ),
                          TextSpan(
                            text: 'Stay Healthy',
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                   imageUrl:  'https://img.icons8.com/color/452/google-logo.png',
                                    placeholder: (context, url) =>  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 20,),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                  width: 30,
                                  height: 30,
                                  ),
                                  Text(
                                    'Google Sign In',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ).paddingLeft(10),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Container(

                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                   imageUrl:  'https://img.icons8.com/color/452/facebook-new.png',
                                    placeholder: (context, url) =>  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 20,),
                                    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                    width: 30,
                                    height: 30,

                                  ).paddingOnly(
                                      left: 10),
                                  Text(
                                    'Facebook Sign In',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ).paddingLeft(10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(top: 20, bottom: 10),
                      const Divider(
                        thickness: 0.5,
                      ),

                      PrimaryFormFilde(
                        label: 'Email',
                        hint: 'Enter your email',
                        icon: FontAwesomeIcons.envelope,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        validator: (value) {
                          if (value!.isEmpty ) {
                            return 'Please enter your email';
                          }
                          if(!value.isEmail)
                            {
                              return 'Please enter valid email';
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
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }

                          return null;
                        },
                      ).paddingTop(20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/forgot-password');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),

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
                            controller.logIn();
                          },
                          child: controller.isLogin.value
                              ? LoadingAnimationWidget.inkDrop(
                              color: Colors.white, size: 20)
                              : Text(
                              'Sign In', style: Theme
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
                            'Don\'t have an account?',
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
                              Get.toNamed(Routes.SINGUP);
                            },
                            child: Text(
                              'Sign Up',
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


