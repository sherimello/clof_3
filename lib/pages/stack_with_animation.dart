import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StackWithAnimation extends StatefulWidget {
  const StackWithAnimation({super.key});

  @override
  State<StackWithAnimation> createState() => _StackWithAnimationState();
}

class _StackWithAnimationState extends State<StackWithAnimation> {

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemIndigo,
        title: Text(
          "Stack & Animation Example",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: size.width * .055),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 955),
                curve: Curves.linearToEaseOut,
                width: !isClicked ? size.width * .35 : size.width * .55,
                height: !isClicked ? size.width * .35 : size.width * .55,
                decoration: BoxDecoration(
                  color: const Color(0xff969696),
                  borderRadius: BorderRadius.circular(1000)
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 955),
                curve: Curves.linearToEaseOut,
                width: !isClicked ? size.width * .35 : size.width * .45,
                height: !isClicked ? size.width * .35 : size.width * .45,
                decoration: BoxDecoration(
                  color: const Color(0xff737373),
                  borderRadius: BorderRadius.circular(1000)
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: Container(
                  width: size.width * .35,
                  height: size.width * .35,
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    borderRadius: BorderRadius.circular(1000)
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
