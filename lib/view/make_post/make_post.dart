import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:cbb/res/assets/app_icons.dart';
import 'package:cbb/res/assets/app_images.dart';
import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/view_model/controllers/make_post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MakePost {
  final controller = Get.put(MakePostController());
  showPostSheet() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      isDismissible: false,
      Container(
        height: MediaQuery.sizeOf(Get.context!).height,
        width: MediaQuery.sizeOf(Get.context!).width,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close_sharp,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.withOpacity(.2),
                        backgroundImage:
                            const AssetImage(AppImages.documentary),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Request',
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Obx(() => GestureDetector(
                        onTap: controller.pikedFilePath.isEmpty
                            ? null
                            : () => controller.uploadPost(),
                        child: Container(
                          height: 40,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.pikedFilePath.isEmpty
                                  ? Colors.grey.withOpacity(.2)
                                  : Colors.blue,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            'Post',
                            style: TextStyle(
                                color: controller.pikedFilePath.isEmpty
                                    ? Colors.grey
                                    : Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLength: 50,
                controller: controller.title,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    hintText: 'What is the title of you post?',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              const Divider(),
              TextFormField(
                controller: controller.description,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What do you want to talk about?',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.type.value == 'image') {
                  return ImagePicked(path: controller.pikedFilePath.value);
                } else if (controller.type.value == 'pdf') {
                  return PdfPicked(
                    name: controller.pikedFileName.value,
                  );
                } else if (controller.type.value == 'video') {
                  return VideoPicked(path: controller.pikedFilePath.value);
                } else {
                  return Container();
                }
              }),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => controller.picFile(),
                      child: const Icon(
                        Icons.image,
                        color: Colors.black87,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePicked extends StatelessWidget {
  const ImagePicked({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.file(File(path));
  }
}

class PdfPicked extends StatelessWidget {
  const PdfPicked({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppIcon.pdf),
        const SizedBox(
          width: 20,
        ),
        Text(name)
      ],
    );
  }
}

class VideoPicked extends StatefulWidget {
  const VideoPicked({
    super.key,
    required this.path,
  });

  final String path;

  @override
  State<VideoPicked> createState() => _VideoPickedState();
}

class _VideoPickedState extends State<VideoPicked> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoInitialize: true,
      allowedScreenSleep: false,
      showControls: true,
      autoPlay: false,
      allowFullScreen: true,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Expanded(
                    child: Chewie(
                  controller: _chewieController!,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
