import 'dart:ui';

import 'package:flutter/material.dart';


class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  // late final VideoPlayerController _videoPlayerController;
  bool _showCode = false;

  @override
  void initState() {
    super.initState();
    // _videoPlayerController =
    //     VideoPlayerController.asset('assets/video/restored_equilibrium.mp4')
    //       ..setLooping(true)
    //       ..initialize();

    // if (!kDebugMode) {
    //   _videoPlayerController.play();
    // }

    Future.delayed(
      const Duration(seconds: 3, milliseconds: 500),
      () => setState(() => _showCode = true),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset('assets/image/sebrae.jpg', fit: BoxFit.cover,),
        ),
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _showCode ? 1.0 : 0.0,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 300,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 24,
                    children: [
                      Text(
                        'Código de acesso',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        '315689',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
