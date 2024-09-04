import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/modules/profile/controllers/profile_controller.dart';

class UserRequestView extends GetView<ProfileController> {
  const UserRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Requests'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "We greatly appreciate your contribution to our community by requesting the following products."
                    " We will notify you as soon as the product becomes available. Thank you for your patience."
                    " and we will reward you for your contribution.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              20.height,
              Expanded(
                child: Obx(() {
                  if (controller.getRequestsProductModel.value == null) {
                    return  LoadingAnimationWidget.inkDrop(
                      size: 30,
                      color: Colors.grey.shade300,
                    );
                  } else if (controller.getRequestsProductModel.value?.data?.isEmpty ?? true) {
                    return const Text("No requests found.");
                  } else {
                    return ListView.builder(
                      itemCount: controller.getRequestsProductModel.value?.data?.length ?? 0,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final request = controller.getRequestsProductModel.value?.data?[index];
                        return RequestWidgets(
                          title: request?.name ?? 'N/A',
                          subtitle: request?.description ?? 'No description',
                          barCode: request?.barCode ?? 'No barcode',
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestWidgets extends StatelessWidget {
  final String title;
  final String subtitle;
  final String barCode;

  const RequestWidgets({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.barCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            3.height,
            Text(
              'Bar Code: $barCode',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
        leading: const Icon(Icons.pending, color: Colors.deepPurple),
        trailing: Text(
          'Pending',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
