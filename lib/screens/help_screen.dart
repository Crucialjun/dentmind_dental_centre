import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Text("Need help?"),
        const Text("24/7"),
        const Text("Help Centre"),
        SvgPicture.asset("assets/support.svg"),
        const Text("Tell us how we can help"),
        const Text("Our support crew is standing by for services and support"),
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: primaryAppColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/chat.png"),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Chat",
                      style: TextStyle(),
                    ),
                    Text("Start a conversation now!"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
