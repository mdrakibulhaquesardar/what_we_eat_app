import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../controllers/bar_scan_controller.dart';

class BarScanView extends StatelessWidget {
  const BarScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BarScanController controller = Get.put(BarScanController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          QRView(
            key: controller.qrKey,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderRadius: 20,
              borderLength: 20,
              borderWidth: 10,

              cutOutHeight: 100,
              cutOutWidth: MediaQuery.of(context).size.width - 100,

              overlayColor: const Color.fromRGBO(0, 0, 0, 0.5),


            ),
            onQRViewCreated: controller.onQRViewCreated,

          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height - 200,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),


              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  child: IconButton(onPressed: (){
                    controller.controller?.toggleFlash();
                  }, icon: const Icon(Icons.flash_on , color: Colors.green,)),
                ),


                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  child: IconButton(onPressed: (){
                    controller.controller?.flipCamera();
                  }, icon: const Icon(Icons.camera_alt)),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  child: IconButton(onPressed: (){
                    controller.pauseScanner();
                  }, icon: const Icon(Icons.pause)),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  child: IconButton(onPressed: (){
                    controller.resumeScanner();
                  }, icon: const Icon(Icons.play_arrow)),
                ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
