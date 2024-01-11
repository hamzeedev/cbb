import 'package:chewie/chewie.dart';
import 'package:cbb/view/home/components/post_sender.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key, required this.snapshot,
     this.showSender=true,
  });
  final DataSnapshot snapshot;
  final bool showSender ;
  @override
  State<VideoPost> createState() => _VideoPostState();
}
class _VideoPostState extends State<VideoPost> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
      widget.snapshot.child('url').value.toString()
        ))
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
                const SizedBox(
                  height: 5,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.snapshot.child('title').value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                if(widget.showSender)    const SizedBox(height: 10,),
              if(widget.showSender)   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PostSender(
                    snapshot: widget.snapshot,
                      image: widget.snapshot
                          .child('sender')
                          .child('profilePicture')
                          .value
                          .toString(),
                      name: widget.snapshot
                          .child('sender')
                          .child('userName')
                          .value
                          .toString(),
                      postDate: widget.snapshot
                          .child('sender')
                          .child('postDate')
                          .value
                          .toString(),
                      senderUID: widget.snapshot
                          .child('sender')
                          .child('senderUID')
                          .value
                          .toString()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
