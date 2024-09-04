import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/modules/home/widges/minicard.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';
import 'package:what_we_eat/app/utils/inAppList.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Keep Track Your Food That You Eat',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 5,
                runSpacing: 5,
                direction: Axis.horizontal,
                children: [
                  MiniCard(
                    icon: FontAwesomeIcons.circleCheck,
                    onTap: () {
                      Get.toNamed(Routes.FOOD_DETAILS,parameters: {"title":"Halal Foods","totalItems":"145002","nextRoute":"/food-details",'ID':'1'});
                    },
                    title: "Halal Foods",
                    iconColor: Colors.green,
                    subTitle: "All Halal Food You can Eat",
                  ),
                  MiniCard(
                    icon: FontAwesomeIcons.ban,
                    onTap: () {
                      Get.toNamed(Routes.FOOD_DETAILS,parameters: {"title":"Ban Foods","totalItems":"4510","nextRoute":"/food-details",'ID':'2'});
                    },
                    title: "Ban List",
                    iconColor: Colors.red,
                    subTitle: "All Food You Can't Eat",
                  ),
                  MiniCard(
                    icon: FontAwesomeIcons.bottleDroplet,
                    onTap: () {
                      Get.toNamed(Routes.FOOD_DETAILS,parameters: {"title":"Mixed Alcohol","totalItems":"145002","nextRoute":"/food-details",'ID':'3'});
                    },
                    title: "Mixed Alcohol",
                    iconColor: Colors.deepPurpleAccent,
                    subTitle: "Alcohol include Food",
                  ),
                  MiniCard(
                    icon: FontAwesomeIcons.piggyBank,
                    onTap: () {
                      Get.toNamed(Routes.FOOD_DETAILS,parameters: {"title":"Pig Meat","totalItems":"145002","nextRoute":"/food-details",'ID':'4'});
                    },
                    title: "Pig Meat",
                    subTitle: "Pig Meat,fats include Food",
                    iconColor: Colors.orange,
                  ),

                ],
              ),
              16.height,
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Common food",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,

                          ),
                    ),
                    SizedBox(
                      height:  MediaQuery.of(context).size.height * 0.25,
                      child: GridView.builder(

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: InAppList.commonFoodImageList.length,
                        physics:  const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl:  InAppList.commonFoodImageList[index]["image"],
                                  placeholder: (context, url) =>  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 20,),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                  width: 50,
                                  height: 50,
                                ).cornerRadiusWithClipRRect(10).paddingBottom(10),
                                Text(
                                  InAppList.commonFoodImageList[index]["title"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ).paddingLeft(10).paddingTop(10),
              ).paddingOnly(left: 10, right: 10),
              16.height,
              Text("Popular features  ",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),).paddingLeft(10),
              PopularFeaturesWidget(
                onTap: () {
                 Get.toNamed(Routes.BAR_SCAN);
                },
                title: "Product Scanner",
                subTitle: "Scan Product Barcode and get details",
                icon: FontAwesomeIcons.qrcode,
                color: Colors.green,
              ),
              PopularFeaturesWidget(
                onTap: () {
                  Get.toNamed(Routes.GEMINI_AI);
                },
                title: "AI Scanner",
                subTitle: "AI Based Scanner to get details",
                icon: FontAwesomeIcons.robot,
                color: Colors.deepPurpleAccent,
              ),

            ],
          )),
    );
  }
}

class PopularFeaturesWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;

 final Callback onTap;

  const PopularFeaturesWidget({
    super.key,
    required this.onTap, required this.title, required this.subTitle, required this.icon, required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),).paddingOnly(left: 5),
                      Text(subTitle,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color,
                      ),).paddingOnly(left: 5),
                    ],
                  ),

                  const Spacer(),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Icon(
                         icon,
                          color: color,
                        ),
                      ],
                    ),
                  )
                ],
              ),


            ),
          );

  }
}
