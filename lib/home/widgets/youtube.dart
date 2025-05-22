import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeIframeWidget extends StatefulWidget {
  final String videoId; // The video ID from YouTube (e.g., "dQw4w9WgXcQ")

  YouTubeIframeWidget({required this.videoId});

  @override
  State<YouTubeIframeWidget> createState() => _YouTubeIframeWidgetState();
}

class _YouTubeIframeWidgetState extends State<YouTubeIframeWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    super.initState();
  }

// If the requirement is just to play a single video.

  final YoutubePlayerController controller = YoutubePlayerController(
    params: YoutubePlayerParams(
      showFullscreenButton: true,
      mute: false,
      showVideoAnnotations: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Initialize the YouTube player controller

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: YoutubePlayer(
          controller: _controller,
        ));
  }
}
