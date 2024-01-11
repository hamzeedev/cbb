import 'package:cbb/res/assets/app_images.dart';
import 'package:cbb/view_model/services/splash_services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   SplashServices().isLogin();
  // }
  @override
  void initState() {
    super.initState();
    // Initialize the video controller
    _controller = VideoPlayerController.asset('assets/splash/cbb_v.mp4')
      ..initialize().then((_) {
        // Ensure the video is fully initialized before playing
        _controller.play();
        _controller.setLooping(true);
        // Update the state after initialization
        setState(() {});
      });
    SplashServices().isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd0c8cc),
      body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                        child: Image.asset(
                      AppImages.uperSplashImg,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fill,
                    )),
                    Expanded(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Image.asset(
                              AppImages.splashImageBlueImg,
                              fit: BoxFit.fill,
                            ),
                    ),
                    // Expanded(
                    //     child: Image.asset(
                    //   AppImages.splashImageBlueImg,
                    //   fit: BoxFit.fill,
                    // )),
                    Expanded(
                        child: Image.asset(
                      AppImages.lowerSplashImg,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fill,
                    )),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Develop by:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'Cui Sahiwal',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
