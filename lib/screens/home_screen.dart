import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translator/utils/constants.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String speechText = "SpeechText";
  final translator = GoogleTranslator();
  bool isListening = false;

  TextEditingController controller = TextEditingController();
  String from = 'en';
  String to = 'ur';
  String input = 'Translated Text';
  String fromValue = 'English';
  String toValue = 'Urdu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Translate",
          style: GoogleFonts.acme(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From ",
                        style: GoogleFonts.acme(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(fromValue),
                            items: languages.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                                onTap: () {
                                  if (e == languages[0]) {
                                    from = languagesCode[0];
                                  } else if (e == languages[1]) {
                                    from = languagesCode[1];
                                  } else if (e == languages[2]) {
                                    from = languagesCode[2];
                                  } else if (e == languages[3]) {
                                    from = languagesCode[3];
                                  } else if (e == languages[4]) {
                                    from = languagesCode[4];
                                  } else if (e == languages[5]) {
                                    from = languagesCode[5];
                                  } else if (e == languages[6]) {
                                    from = languagesCode[6];
                                  } else if (e == languages[7]) {
                                    from = languagesCode[7];
                                  } else if (e == languages[8]) {
                                    from = languagesCode[8];
                                  }
                                  setState(() {});
                                },
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                fromValue = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: TextField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: 'Write SomeThing...',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.white)),
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To ",
                        style: GoogleFonts.acme(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(toValue),
                            items: languages.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                                onTap: () {
                                  if (e == languages[0]) {
                                    to = languagesCode[0];
                                  } else if (e == languages[1]) {
                                    to = languagesCode[1];
                                  } else if (e == languages[2]) {
                                    to = languagesCode[2];
                                  } else if (e == languages[3]) {
                                    to = languagesCode[3];
                                  } else if (e == languages[4]) {
                                    to = languagesCode[4];
                                  } else if (e == languages[5]) {
                                    to = languagesCode[5];
                                  } else if (e == languages[6]) {
                                    to = languagesCode[6];
                                  } else if (e == languages[7]) {
                                    to = languagesCode[7];
                                  } else if (e == languages[8]) {
                                    to = languagesCode[8];
                                  }
                                  setState(() {});
                                },
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                toValue = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey),
                ),
                child: Center(
                  child: SelectableText(
                    input,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              if (isLoading)
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                )
              else
                InkWell(
                  onTap: () {
                    translate();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Translate",
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  translate() async {
    try {
      setState(() {
        isLoading = true;
      });

      if (controller.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Something")));
      } else {
        final translation = await translator.translate(controller.text, from: from, to: to);
        setState(() {
          input = translation.text;
        });
      }
    } on SocketException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
