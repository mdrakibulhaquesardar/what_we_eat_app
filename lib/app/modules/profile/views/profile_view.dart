import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/data/local_database.dart';
import 'package:what_we_eat/app/models/UserModel.dart';
import 'package:what_we_eat/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProfileController controller = Get.put(ProfileController());

    final date = DateTime.parse(getStringAsync(LocalDatabase.userCreated)).toString().split(" ")[0];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                   SizedBox(
                    width: 90,
                    height: 90,
                     child: CachedNetworkImage(
                       imageUrl: "https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg",
                       placeholder: (context, url) =>  LoadingAnimationWidget.inkDrop(color: Colors.grey, size: 20,),
                       errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                       width: 90,
                       height: 90,
                     ),

                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getStringAsync(LocalDatabase.userName),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Email: ${getStringAsync(LocalDatabase.userEmail)}',
                        style:  Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'Since: $date',
                        style:  Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 30),


              Row(
                children: [
                  Chip(

                      side: const BorderSide(color: Colors.transparent, width: 1),
                      backgroundColor: Colors.orange.shade400,
                      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white
                      ),
                      avatar: const Icon(Icons.star, color: Colors.white,),
                      label: const Text("Freemium")
                  ),
                  10.width,
                  Chip(

                      side: const BorderSide(color: Colors.transparent, width: 1),

                      backgroundColor: Colors.green.shade400,
                      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white
                      ),
                      avatar: const Icon(Icons.check_circle, color: Colors.white,),
                      label: const Text("Active")
                  ),
                ],
              ),

              Text(
                'Profile Information',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold
                ),
              ).paddingOnly(top: 20,bottom: 10),
               ProfileListView(
                 title: 'Edit Profile',
                 subtitle: 'Edit Your Profile information',
                 leadingColor: Colors.orange.shade400,
                 icon: Icons.edit,
                 isEnabled: false,
                 onTap: (){},
               ),
              ProfileListView(
                title: 'Your Requests',
                subtitle: 'Your Requests Are Here',
                leadingColor: Colors.deepPurple.shade400,
                isEnabled: true,
                icon: Icons.pending,
                onTap: (){
                  controller.getRequestsProduct();
                 Get.toNamed(Routes.USERREQUESTS);



                },
              ),
              ProfileListView(
                title: 'Log Out',
                subtitle: 'Your Log out Here',
                leadingColor: Colors.red.shade400,
                isEnabled: true,
                icon: Icons.logout,
                onTap: (){

                Get.defaultDialog(
                  title: "Are You Sure To logout",
                  content: const Text("After logout you have to login aging "),
                  onConfirm: (){
                    controller.logout();
                  },
                  onCancel: (){
                    Get.back();
                  }

                );

                },
              ),







            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListView extends StatelessWidget {
 final Function() onTap;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color leadingColor;
  final bool isEnabled;


  const ProfileListView({
    super.key, required this.title, required this.subtitle, required this.icon, required this.leadingColor, required this.onTap, required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: Colors.grey.shade300)
         ),
        child: ListTile(
          style: ListTileStyle.list,
         onTap: onTap,
          enabled: isEnabled,
         title: Text(title,style: Theme.of(context).textTheme.titleMedium?.copyWith(
           color: Colors.black
         ),),
         subtitle: Text(subtitle),
         leading: Container(
           padding: const EdgeInsets.all(10),
           decoration: BoxDecoration(
             color: leadingColor,
             borderRadius: BorderRadius.circular(10)
           ),
           child:  Icon(icon, color: Colors.white,),
         ),
                      ),
      ),
    );
  }
}
