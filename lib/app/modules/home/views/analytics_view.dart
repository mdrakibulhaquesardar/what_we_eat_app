import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:what_we_eat/app/modules/home/controllers/analytics_controller.dart';

class AnalyticsView extends GetView {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AnalyticsController>();
    _controller.nextRoute = '${Get.parameters['nextRoute']}'; // Set the next route

    final List analyticsItemList = [
      'Finding Update ${Get.parameters['title']} Data',
      'Analyzing ${Get.parameters['totalItems']} Data',
      'Processing  and filtering ${Get.parameters['title']}',
      'Done',
    ];

    return Scaffold(
      body: Column(
        children: [
          // Lottie animation at the top
          Lottie.asset(
            'assets/images/Animation - 1722263597377.json', // Replace with your Lottie file
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          // Column containing rows
          Obx(() {
            return Column(
              children: List.generate(_controller.totalItems, (index) {
                if (index <= _controller.currentItemIndex.value) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${analyticsItemList[index]} ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color:
                                    _controller.currentItemIndex.value == index
                                        ? Colors.blue
                                        : Colors.green,
                              ),
                        ).paddingOnly(left: 16.0),
                        if (_controller.currentItemIndex.value == index)
                          _buildProgressIcon(_controller.progressIndex.value)
                        else if (_controller.currentItemIndex.value > index)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ).paddingOnly(right: 16.0)
                        else
                          const Icon(
                            Icons.hourglass_empty,
                            color: Colors.grey,
                          ).paddingOnly(right: 16.0),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink(); // Hide the row
                }
              }),
            ).paddingOnly(top: 16.0);
          }),
        ],
      ).paddingOnly(top: 24.0),
    );
  }

  Widget _buildProgressIcon(int progressIndex) {
    IconData iconData;
    switch (progressIndex) {
      case 0:
        iconData = FontAwesomeIcons.magnifyingGlass;
        break;
      case 1:
        iconData = Icons.check_circle;
        break;
      case 2:
        iconData = FontAwesomeIcons.file;
        break;
      case 3:
        iconData = Icons.check_circle;
        break;
      default:
        iconData = Icons.error;
    }
    return Icon(
      iconData,
      color: Colors.blue,
    ).paddingOnly(right: 16.0);
  }
}
