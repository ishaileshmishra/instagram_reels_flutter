import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_reels_flutter/components/widgetcompo.dart';
import 'package:video_player/video_player.dart';


class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _ReelsState createState() => _ReelsState();
}

final videoPlayerController = VideoPlayerController.network(
    'https://player.vimeo.com/external/510479906.hd.mp4?s=5b5514baccbc5981840ae48c56347c297626f74f&profile_id=175&oauth2_token_id=57447761');

class _ReelsState extends State<Reels> {


  @override
  void initState() {
    loadVideoClip();
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
          Chewie(
            controller: chewieController,
          ), // Video Player
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
    chewieController.dispose();
    super.dispose();
  }

  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: true,
  );
}
