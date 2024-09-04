import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/modules/home/controllers/analytics_controller.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/app/utils/FoodListWidget.dart';
import 'package:what_we_eat/app/utils/buildShowModalBottomSheet.dart';

import '../controllers/food_details_controller.dart';

class FoodDetailsView extends GetView<FoodDetailsController> {
  const FoodDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // AnalyticsController analyticsController = Get.find<AnalyticsController>();
    FoodDetailsController foodDetailsController = Get.find<FoodDetailsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(foodDetailsController.title ?? ""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All ${foodDetailsController.title} will be listed here!',
              style: Theme.of(context).textTheme.bodyMedium,
            ).paddingOnly(bottom: 20),
            foodDetailsController.isShowSearch
                ? TextField(
              controller: foodDetailsController.searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              onChanged: (query) {
                foodDetailsController.filterProducts(query);
              },
            ).paddingOnly(bottom: 20)
                : const SizedBox(),
            Obx(() {
              if (foodDetailsController.productByCategoryIdModel.value == null) {
                return  Center(child: LoadingAnimationWidget.stretchedDots(color: Colors.green, size: 30)).paddingOnly(top: MediaQuery.of(context).size.height / 3);
              } else if (foodDetailsController.filteredProducts.isEmpty) {
                return  Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/images/Animation - 1722113109708.json',width: 300,height: 300),
                    20.height,
                    Text(
                      "No products found in this ${foodDetailsController.category} ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    5.height,
                    Text(
                      "Are you have added products in Our Database ? ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ElevatedButton(onPressed: (){
                      Get.toNamed(Routes.REQUESTS);
                    }, child:  Text("Add Products",style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),)).paddingOnly(top: 20),

                  ],
                )).paddingOnly(top: MediaQuery.of(context).size.height / 10);
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final product = foodDetailsController.filteredProducts[index];
                    return FoodListWidget(
                      title: product.name ?? "",
                      description: product.description ?? "",
                      image: CachedNetworkImage(
                        imageUrl: product.imageUrl ?? "",
                        placeholder: (context, url) => LoadingAnimationWidget.inkDrop(
                          color: Colors.grey,
                          size: 20,
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                        width: 100,
                        height: 100,
                      ),
                      onTap: () {
                        buildShowModalBottomSheet(
                          context: context,
                          index: index,
                          productByCategoryIdModel: foodDetailsController.productByCategoryIdModel.value!,
                        );
                      },
                    );
                  },
                  itemCount: foodDetailsController.filteredProducts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              }
            }),
          ],
        ).paddingAll(20),
      ),
    );
  }
}
