import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/modules/gemini_Ai/controllers/gemini_ai_controller.dart';



class GeminiAiView extends GetView<GeminiAiController> {
  const GeminiAiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GeminiAiController controller = Get.find();
    ScrollController scrollController = ScrollController();

    controller.messages.listen((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });


    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai Support'),
        centerTitle: true,
        actions: [
          const Icon (FontAwesomeIcons.coins,size: 15).paddingOnly(right: 5.0),
          Text('0',style: TextStyle(
            color: Colors.grey, fontSize: 20,
          ),).paddingOnly(right: 20.0),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              controller: scrollController,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListTile(
                    title: Text(message.content),
                    leading: message.isUser ? const Icon(Icons.person) : const Icon(Icons.smart_toy),
                    trailing: message.image != null ? Image.file(message.image!, width: 50, height: 50) : null,
                    iconColor: message.isUser ? Colors.green : Colors.blue,
                    textColor: message.isUser ? Colors.green : Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                );
              },
            )),
          ),
          Obx(() => controller.isLoading.value ? const LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ) : const SizedBox.shrink()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Write a Queries ...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onSubmitted: (value) {
                      controller.generateContent(value);
                      textController.clear();
                    },

                    onTapOutside:  (PointerDownEvent event) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () async {
                    await controller.pickImage();
                    if (controller.selectedImage.value != null) {
                      controller.generateTextAndImage("Generated with image");
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green,size: 30,),
                  onPressed: () {
                    print("Send button pressed ${textController.text}");
                    if (textController.text.isNotEmpty) {
                      controller.generateContent(textController.text);
                      textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
               Text('Powered by What We Eat AI',style: TextStyle(
                color: Colors.grey.shade400,
              ),).paddingOnly(left: 15.0,bottom: 15.0),
            ],
          )
        ],
      ),
    );
  }
}
