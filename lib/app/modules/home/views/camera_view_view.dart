import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CameraViewView extends GetView {
  const CameraViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CameraViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
