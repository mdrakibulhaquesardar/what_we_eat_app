import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MiniCard extends StatelessWidget {

   Color? color;
   Color? iconColor;
  final IconData icon;
  final String title;
  final String subTitle;
  Function() onTap;


   MiniCard({
    super.key, this.color, required this.icon, this.iconColor, required this.onTap, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width() * 0.45,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: iconColor ?? Colors.black,
              size: 30,

            ).paddingBottom(10),
             Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
            ),
             Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
              ),
            ).paddingTop(10),
          ],
        ),
      ).paddingLeft(10).paddingTop(10),
    );
  }
}