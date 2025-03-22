import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rules_app/ui/equity/viewmodel/equity_screen_viewmodel.dart';
import 'package:rules_app/ui/final_screen/screen/final_screen.dart';


class EquityScreen extends StatefulWidget {
  const EquityScreen({super.key});

  @override
  State<EquityScreen> createState() => _EquityScreenState();
}

class _EquityScreenState extends State<EquityScreen> {
  late final TextEditingController _passwordTextController;
  final EquityScreenViewModel _equityScreenViewModel = EquityScreenViewModel();

  bool _showInvalidMessage = false;

  @override
  void initState() {
    super.initState();
  _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/gif/rules.gif', fit: BoxFit.fill,),
          ),
      
          Positioned(
            top: 210,
            left: 64,
            right: 64,
            child: Center(
              child: ListenableBuilder(
                listenable: _equityScreenViewModel,
                builder:
                    (context, child) => ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder:
                          (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _equityScreenViewModel.corruptedRules[index].text,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Checkbox(
                                activeColor: Colors.red,
                                value:
                                    _equityScreenViewModel
                                        .corruptedRules[index]
                                        .selected,
                                onChanged: (_) {
                                  _equityScreenViewModel.onCorruptedRuleTap(
                                    index,
                                  );
                                },
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: _equityScreenViewModel.corruptedRules.length,
                    ),
              ),
            ),
          ),
      
          Positioned(
            top: 680,
            left: 64,
            right: 64,
            child: Center(
              child: ListenableBuilder(
                listenable: _equityScreenViewModel,
                builder:
                    (context, child) => ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder:
                          (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  _equityScreenViewModel.equityRules[index].text,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Checkbox(
                                activeColor: Colors.green,
                                value:
                                    _equityScreenViewModel
                                        .equityRules[index]
                                        .selected,
                                onChanged: (_) {
                                  _equityScreenViewModel.onEquityRuleTap(index);
                                },
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: _equityScreenViewModel.equityRules.length,
                    ),
              ),
            ),
          ),
      
          Positioned(
            bottom: 16,
            child: SizedBox(
              width: 250,
              height: 100,
              child: Column(
                spacing: 16,
                children: [
                  if (_showInvalidMessage)
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Regras selecionadas inválidas!',
                          textStyle: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  GestureDetector(
                    onTap: () {
                      if (_equityScreenViewModel.canGoNext) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FinalScreen()),
                        );
                      } else {
                        setState(() {
                          _showInvalidMessage = true;
                        });
      
                        Future.delayed(
                          const Duration(seconds: 2, milliseconds: 500),
                          () => setState(() => _showInvalidMessage = false),
                        );
                      }
                    },
                    child: Image.asset('assets/image/reset_button.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
