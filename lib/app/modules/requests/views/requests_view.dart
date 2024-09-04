import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/app/utils/PrimaryFormFilde.dart';

import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  const RequestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RequestsController controller = Get.put(RequestsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Requests'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt,color: Colors.green,size: 30,),
            onPressed: () {
              Get.toNamed(Routes.SCANNER);
            },
          ),
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: GestureDetector(
          onTap: () {
            controller.productNameFocusNode.unfocus();
            controller.productBarCodeFocusNode.unfocus();
            controller.productDescriptionFocusNode.unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Request A New ',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Product Details',
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
                        Text(
                          'You can request a new product by filling the form below and submitting it. '
                              'We will review your request and update our database accordingly.',
                          textAlign: TextAlign.center, style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Colors.black,

                        ),).paddingOnly(top: 16, bottom: 30),
                        PrimaryFormFilde(
                            label: 'Product Name',
                            hint: 'Enter Product Name',
                            keyboardType: TextInputType.text,
                            focusNode: controller.productNameFocusNode,
                            controller: controller.productNameController,
                            icon: Icons.food_bank,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Product Name is required';
                              }
                              return null;
                            }).paddingBottom(16),
                        PrimaryFormFilde(
                            label: 'Product Bar Code',
                            hint: 'Enter Product Bar Code',
                            keyboardType: TextInputType.number,
                            focusNode: controller.productBarCodeFocusNode,
                            controller: controller.productBarCodeController,
                            icon: Icons.qr_code,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Product Description is required';
                              }
                              return null;
                            }),
                        PrimaryFormFilde(
                            label: 'Product Description',
                            hint: 'Short Description of the Product',
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            focusNode: controller.productDescriptionFocusNode,
                            controller: controller.productDescriptionController,
                            icon: Icons.description,
                            validator: (value) {
                              return null;
                            }).paddingTop(16),

                        Obx(() {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              disabledBackgroundColor: Colors.grey.shade400,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: controller.isLogin.value || !controller.checkboxValue.value
                                ? null
                                : () {
                              controller.requestProduct();

                            },
                            child: controller.isLogin.value
                                ? LoadingAnimationWidget.inkDrop(
                                color: Colors.white, size: 20)
                                : Text(
                                'Submit', style: Theme
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
                        Text(

                          'It is not always possible to store every product in our database, but you can help us by adding new products through the form below and earn rewards—your contributions are greatly appreciated!',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                            color: Colors.black,
                          ),
                        ).paddingOnly(top: 16,left: 10,right: 10),
                        Row(
                          children: [
                            Obx(() {
                              return Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                value: controller.checkboxValue.value,
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                onChanged: (value) {
                                  controller.checkboxValue.value = value!;
                                },
                              );
                            }),
                            Expanded(
                              child: Text(
                                textDirection: TextDirection.ltr,
                                'By clicking on the Submit button, you agree to our Terms & Conditions and Privacy Policy',
                                textAlign: TextAlign.start,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),



                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
