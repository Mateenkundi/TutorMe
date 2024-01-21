import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants.dart';

class SignUpScreenTopImage extends StatefulWidget {
  final int index;
  const SignUpScreenTopImage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<SignUpScreenTopImage> createState() => _SignUpScreenTopImageState();
}

class _SignUpScreenTopImageState extends State<SignUpScreenTopImage> {
  File? image;
  bool isLoading = false;
  final imagePicker = ImagePicker();

  Future<void> getImageFromGallery(ImageSource source) async {
    try {
      setState(() => isLoading = true);
      final imagePick = await imagePicker.pickImage(source: source);
      final imageTemporary = File(imagePick!.path);
      setState(() => image = imageTemporary);
      setState(() => isLoading = false);
    } catch (e) {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Column(
      children: [
        Text(
          widget.index == 0? "Teacher Registration" :"Student Registration".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding),
        widget.index == 0? Column(
          children: [
            image == null
                ? Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(
                image: AssetImage("assets/profile.png"),
                height: 100,
              ),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.file(
                image!,
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () =>
                        getImageFromGallery(ImageSource.gallery),
                    child: const Text("Add Image")),
                TextButton(
                  onPressed: () =>
                      getImageFromGallery(ImageSource.camera),
                  child: const Text("Capture Image"),
                ),
              ],
            ),
          ],
        ) : Column(
          children: [
            Image(
              image: AssetImage("assets/slide_2.png"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}