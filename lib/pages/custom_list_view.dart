import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {

  List<String> images = ["assets/images/me.png", "assets/images/model1.png", "assets/images/model2.png"],
  names = ["shahriar rahman", "uchiha itachi", "hatake kakashi"];
  List<int> ages = [25, 19, 26];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemIndigo,
        title: Text(
          "Custom ListView Example",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: size.width * .055),
        ),
      ),
      body: Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5.5),
                child: Container(
                  width: size.width * .87,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: CupertinoColors.systemIndigo.withOpacity(.25)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(images[index],
                            width: size.width * .25,
                            height: size.width * .25,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(names[index],
                          style: TextStyle(
                            fontSize: size.width * .051,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                          Text("${ages[index]} years old.")
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
