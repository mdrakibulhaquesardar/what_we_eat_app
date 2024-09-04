import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Message {
  String content;
  final bool isUser;
  final File? image;

  Message({required this.content, required this.isUser, this.image});
}

TextEditingController textController = TextEditingController();

class GeminiAiController extends GetxController {
  final gemini = Gemini.instance;
  var isLoading = false.obs;
  var messages = <Message>[].obs;
  var selectedImage = Rx<File?>(null);

  void generateContent(String prompt) {
    messages.add(Message(content: prompt, isUser: true));
    isLoading.value = true;

    var aiMessage = Message(content: '', isUser: false);
    messages.add(aiMessage);

    final buffer = StringBuffer();

    gemini.streamGenerateContent(prompt).listen(
          (data) {
        buffer.write(data.output ?? '');
      },
      onDone: () {
        _updateMessageContent(buffer.toString(), aiMessage);
        isLoading.value = false;
      },
      onError: (error) {
        messages.add(Message(content: 'Error', isUser: false));
        isLoading.value = false;
        log('streamGenerateContent exception', error: error);
      },
    );
  }

  void generateTextAndImage(String prompt) {
    messages.add(Message(content: prompt, isUser: true, image: selectedImage.value));

    gemini.info(model: 'gemini-pro')
        .then((info) => print(info))
        .catchError((e) => log('info', error: e));

    isLoading.value = true;

    var aiMessage = Message(content: '', isUser: false);
    messages.add(aiMessage);

    if (selectedImage.value != null) {
      final buffer = StringBuffer();

      gemini.textAndImage(
        text: prompt,
        images: [selectedImage.value!.readAsBytesSync()],
      ).then(
            (data) {
          _updateMessageContent(data?.output ?? '', aiMessage);
          isLoading.value = false;
        },

        onError: (error) {
          if (error is GeminiException) {
            Get.showSnackbar(const GetSnackBar(
              message: 'Image Analyze is not available on this account.',
              duration: Duration(seconds: 5),
              backgroundColor: Colors.red,
              icon: Icon(Icons.error, color: Colors.white),
            ));
          } else {
            messages.add(Message(content: 'You Are Now Free User, You Cannot Use Image Analyze On this Account', isUser: false));
          }
          isLoading.value = false;
          log('textAndImage exception', error: error);
        },
      );
    } else {
      log('No image selected.');
      isLoading.value = false;
      messages.add(Message(content: 'No image selected.', isUser: false));
    }

    selectedImage.value = null;
  }

  void _updateMessageContent(String text, Message aiMessage) {
    aiMessage.content = text;
    messages[messages.length - 1] = aiMessage;
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log('Image picker error: $e');
    }
  }


  @override
  void onInit() {
    super.onInit();
    //default message
   Future.delayed(
        const Duration(seconds: 1),
            () => messages.add(Message(content: 'Hello, I am Gemini AI. How can I help you?', isUser: false))
    );
  }
}
