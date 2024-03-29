import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:image_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_app/services/assets_manager.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        chatIndex == 0
                            ? AssetsManager.userImage
                            : AssetsManager.botImage,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: chatIndex == 0
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 2),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                  color: Colors.indigo,
                                  border: Border.all(color: Colors.indigo),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextWidget(
                                label: msg,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      : shouldAnimate
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                                child: Container(
                                  padding: EdgeInsets.all(9.0),
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 0.5,
                                        ),
                                      ],
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                    child: AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        repeatForever: false,
                                        displayFullTextOnTap: true,
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                            msg.trim(),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                                child: Container(
                                  padding: EdgeInsets.all(9.0),
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 0.5,
                                        ),
                                      ],
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    msg.trim(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
