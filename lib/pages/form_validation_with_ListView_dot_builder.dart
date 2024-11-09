import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormValidationWithListViewDotBuilder extends StatefulWidget {
  const FormValidationWithListViewDotBuilder({super.key});

  @override
  State<FormValidationWithListViewDotBuilder> createState() => _FormValidationWithListViewDotBuilderState();
}

class _FormValidationWithListViewDotBuilderState extends State<FormValidationWithListViewDotBuilder> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  var names = [];
  var size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemIndigo,
          title: Text(
            "Form Validation Example",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: size.width * .055),
          ),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(21.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter A Name";
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: const InputDecoration(
                              labelText: "name", hintText: "eg. inan"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.snackbar(
                                    "success!!!", "the name ${_nameController.text} has been added!",
                                    backgroundColor: CupertinoColors.systemIndigo,
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: const EdgeInsets.all(21),
                                    colorText: Colors.white);
                                setState(() {
                                  names.add(_nameController.text);
                                });

                                _nameController.clear();

                              }
                            },
                            child: const Text("submit"))
                      ],
                    ))),
            Expanded(child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5.5),
                child: ListTile(
                  title: Text(names[index]),
                  tileColor: Colors.grey.withOpacity(.35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)
                  ),
                ),
              );
            }))
          ],
        ),
    );
  }
}
