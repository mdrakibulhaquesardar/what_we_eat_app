import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InAppList {
   InAppList._();


 static List<IconData> icons = [
    FontAwesomeIcons.ban,
    FontAwesomeIcons.qrcode,
    FontAwesomeIcons.robot,
   FontAwesomeIcons.ban,
   FontAwesomeIcons.qrcode,
   FontAwesomeIcons.robot,

  ];

  static List titles = [
    'Ban List',
    'QR Code',
    'Ai Scan',
    'Ban List',
    'QR Code',
    'Ai Scan',
  ];

  static List colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];


  static List popularFeaturesColors= [
    Colors.red.withOpacity(0.2),
    Colors.blue.withOpacity(0.2),
    Colors.green.withOpacity(0.2),
    Colors.purple.withOpacity(0.2),
    Colors.orange.withOpacity(0.2),
  ];



  static List analyticsItemList = [
    'Finding Data from Server',
    'Analyzing Data for Insights',
    'Processing Data and filtering',
    'Done',
  ];

  static List commonFoodImageList = [
    {
      "title": "Coca Cola",
      "image": "https://thumbs.dreamstime.com/b/coca-cola-bottle-isolated-white-background-126781101.jpg",
    },
    {
      "title": "Bombay",
      "image": "https://chaldn.com/_mpimage/bombay-sweets-mr-twist-25-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D146892&q=best&v=1&m=400",
    },
    {
      "title": "Lay's Chips",
      "image": "https://i5.walmartimages.com/seo/Lay-s-Classic-Potato-Chips-Snack-Chips-8-oz_6899fc7b-7a12-4ada-b35c-79d82777c3a3.0d4d8e191bb03429c235c7181d64432f.jpeg",
    },
    {
      "title": "KitKat",
      "image": "https://st2.depositphotos.com/3500059/44935/i/450/depositphotos_449358230-stock-photo-itancourt-france-2021-kitkat-brand.jpg",
    },
    {
      "title": "Sprite",
      "image": "https://m.media-amazon.com/images/I/61AlVWlaTwL.jpg",
    },
    {
      "title": "Drinko Float",
      "image": "https://images.othoba.com/images/thumbs/0232393_drinko-float-250-ml-litchi.jpeg",

    },
    {
      "title": "Cadbury",
      "image": "https://m.media-amazon.com/images/I/61GEIhLz87L._SL1000_.jpg",
    },
    {
      "title": "chocolate",
      "image": "https://gofresh.com.bd/wp-content/uploads/2022/04/cadbury-dairy-milk-chocolate-bar-132-gm-copy.jpg",

    },


  ];


  //randomy change index position of the list and ignore the duplicate values in the list
  static List shuffleList(List list) {
    list.shuffle(Random(
        DateTime.now().millisecondsSinceEpoch
    ));
    //remove duplicate values
    list = list. toSet(). toList();
    return list;
  }


  static List popularFeaturesList = [
    {
      "title": "Ai Product Detection",
      'subTitle': 'Detect and analyze product details',
      "icon": FontAwesomeIcons.gears,
      "color": Colors.red,
    },
    {
      "title": "Bar Code Scanner ",
      'subTitle': 'Scan Bar code and get product details ',
      "icon": FontAwesomeIcons.qrcode,
      "color": Colors.blue,
    },
    {
      "title": "Ai Chat Bot ",
      'subTitle': 'Chat with Ai Bot And Customer Support',
      "icon": FontAwesomeIcons.person,
      "color": Colors.green,
    },
    {
      "title": "Scan And Detect ",
      'subTitle': 'Scan and detect fake products',
      "icon": FontAwesomeIcons.circleXmark,
      "color": Colors.purple,
    },
    {
      "title": "Get Recipe",
      'subTitle': 'Scan and get recipe of the product',
      "icon": FontAwesomeIcons.bowlFood,
      "color": Colors.orange,
    },
  ];





}