import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_reels_flutter/components/widgetcompo.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _ReelsState createState() => _ReelsState();
}

final videoPlayerController = VideoPlayerController.network(
    'https://player.vimeo.com/external/552421426.hd.mp4?s=a4e3b5d1768bd29f37298743162e1b15c93856e4&profile_id=172&oauth2_token_id=57447761');

class _ReelsState extends State<Reels> {
  @override
  void initState() {
    loadVideoClip();
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Positioned buildPosLikeComment() {
      return Positioned(
          bottom: 100,
          right: 10,
          width: 50,
          height: 260,
          child: likeShareCommentSave());
    }

    return Scaffold(
      body: Stack(
        children: [
          Chewie(controller: chewie), // Video Player
          CommentWithPublisher(),
          buildPosLikeComment()
        ],
      ),
    );
  }

  void loadVideoClip() async {
    await videoPlayerController.initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewie.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  final chewie = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: true,
    allowFullScreen: true,
    autoInitialize: true,
    cupertinoProgressColors: ChewieProgressColors(),

  );
}
