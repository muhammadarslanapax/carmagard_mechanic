import 'package:flutter/material.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';

class OTPToken extends StatefulWidget {
  const OTPToken({super.key});

  @override
  State<OTPToken> createState() => _OTPTokenState();
}

class _OTPTokenState extends State<OTPToken> with Ui {
  FormWidget? phoneNumber;
  FocusNode fcn = FocusNode();
  List<TextEditingController> fieldController =
      List.generate(4, (index) => TextEditingController());
  void clearText() {
    for (int i = 0; i < contrl.length; i++) {
      contrl[i].clear();
    }
  }

  List<TextEditingController> contrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void openKeyboard(FocusNode node) {
    FocusScope.of(context).requestFocus(node);
  }

  List<String> optToken = List.filled(4, 'null');
  List<FocusNode> focus = List.generate(4, (index) => FocusNode());
  @override
  void initState() {
    phoneNumber =
        FormWidget(inputText: '', text: 'Enter Phone Number', context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pSymmetric(10, 20),
      child: SizedBox(
        height: 800,
        width: 800,
        child: Column(
          children: [
            SizedBox(
              height: height(context) - 200,
              child: Column(
                crossAxisAlignment: cStart,
                children: [
                  Padding(
                    padding: pSymmetric(15, 0),
                    child: Column(
                      crossAxisAlignment: cStart,
                      children: [
                        input(black47, 28, 'Almost done!', w700),
                        input(
                            grey66,
                            14,
                            'Please enter the 4 digit pin that was sent to 0813-857-3827',
                            w400),
                        hspacer(20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              4,
                              (index) => Container(
                                height: 57,
                                width: 57,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffBDC5C1)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  obscureText: true,
                                  controller: contrl[index],
                                  focusNode: focus[index],
                                  maxLength: 1,
                                  onChanged: (input) {
                                    setState(() {
                                      optToken[index] = input;
                                    });
                                    if (input.isNotEmpty) {
                                      closeKeyboard(context);
                                      if (index < 3) {
                                        closeKeyboard(context);
                                        openKeyboard(focus[index + 1]);
                                      }
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 40,
                                  ),
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    // hintText: 'Phone Number',
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            button(commonText('Send OTP', white), green),
            hspacer(70),
          ],
        ),
      ),
    );
  }
}
