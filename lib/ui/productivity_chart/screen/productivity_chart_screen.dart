import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rules_app/ui/equity/screen/equity_screen.dart';
import 'package:video_player/video_player.dart';

class ProductivityChartScreen extends StatefulWidget {
  const ProductivityChartScreen({super.key});

  @override
  State<ProductivityChartScreen> createState() =>
      _ProductivityChartScreenState();
}

class _ProductivityChartScreenState extends State<ProductivityChartScreen> {
  late final VideoPlayerController _videoPlayerController;
  late final TextEditingController _passwordTextController;

  final _password = '90811000';
  bool _showPasswordCard = false;
  bool _showInvalidPasswordMessage = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/productivity_chart.mp4')
          ..initialize()
          ..setLooping(true);

    _passwordTextController = TextEditingController();

    if (!kDebugMode) {
      _videoPlayerController.play();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        VideoPlayer(_videoPlayerController),
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _showPasswordCard ? 1.0 : 0.0,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 300,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 50, sigmaX: 50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      Text(
                        'Digite a senha de configuração:',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),

                      TextFormField(
                        controller: _passwordTextController,
                        style: TextStyle(color: Colors.red),
                        obscureText: true,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
                          labelStyle: TextStyle(color: Colors.red),
                        ),
                      ),

                      if (_showInvalidPasswordMessage)
                        Center(
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                'Senha inválida!',
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showInvalidPasswordMessage = false;
                            });
                            if (_passwordTextController.text == _password) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EquityScreen(),
                                ),
                              );
                            } else {
                              setState(() {
                                _showInvalidPasswordMessage = true;
                              });
                              Future.delayed(
                                const Duration(seconds: 2, milliseconds: 500),
                                () => setState(
                                  () => _showInvalidPasswordMessage = false,
                                ),
                              );
                            }
                          },
                          child: SizedBox(
                            width: 250,
                            height: 80,
                            child: Image.asset(
                              'assets/image/config_button.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if(!_showPasswordCard)
        Positioned(
          bottom: 32,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showPasswordCard = true;
              });
            },
            child: SizedBox(
              width: 250,
              height: 150,
              child: Image.asset(
                'assets/image/config_button.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
