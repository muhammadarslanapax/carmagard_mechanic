import 'package:carmagard/Widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:carmagard/View/style.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    this.controller,
    this.color = const Color(0xff111c44),
    required this.hint,
    this.keyType,
  });

  final TextEditingController? controller;
  final Color color;
  final String hint;
  final TextInputType? keyType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Center(
        child: TextFormField(
          // validator: FormBuilderValidators.required(),
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          textAlignVertical: TextAlignVertical.bottom,
          style: const TextStyle(
            color: Colors.black,
          ),
          keyboardType: keyType,
          decoration: InputDecoration(
            fillColor: const Color(0xffD5D5D5),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            //enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class LargeTextField extends StatelessWidget {
  const LargeTextField({
    super.key,
    required this.controller,
    this.color = const Color(0xffD5D5D5),
    this.hint,
  });

  final TextEditingController controller;
  final Color color;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: FormBuilderValidators.required(),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      expands: true,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      //maxLength: 160,
      //keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: color,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.text,
      this.hint,
      this.context,
      this.suffix,
      this.style,
      this.validator,
      required this.controller});
  final String text;
  final String? hint;
  final BuildContext? context;
  final Widget? suffix;
  final InputDecoration? style;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
            color: const Color(0xff616161),
            fontSize: 13,
            text: widget.text,
            fontWeight: FontWeight.w700),
        // const SizedBox(height: 5),
        TextFormField(
          obscureText: hidePassword,
          autocorrect: false,
          enableSuggestions: false,
          controller: widget.controller,
          validator: widget.validator,
          style: const TextStyle(color: Colors.black),
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),

            fillColor: const Color(0xffD5D5D5),
            hintText: widget.hint ?? '',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 28,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),

            // errorText: validmail(email),
          ),
        ),
      ],
    );
  }
}

class TextFieldWithColumn extends StatelessWidget {
  const TextFieldWithColumn({
    super.key,
    this.controller,
    this.color = const Color(0xff111c44),
    required this.hint,
    this.keyType,
  });

  final TextEditingController? controller;
  final Color color;
  final String hint;
  final TextInputType? keyType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xff616161)),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            color: Colors.black,
          ),
          keyboardType: keyType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(13),
            fillColor: const Color(0xffD5D5D5),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD5D5D5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            //enabledBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

class FormWidget with Ui {
  String? inputText;
  String? text;
  BuildContext? context;
  TextInputType? keyboard;
  Widget? suffix;

  FormWidget({
    required this.inputText,
    required this.text,
    required this.context,
  });

  Widget inputName() {
    return input(grey61, 12, text!, w700);
  }

  Widget textField() {
    return Padding(
      padding: pSymmetric(10, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          inputName(),
          hspacer(5),
          Container(
            width: width(context),
            height: 54,
            alignment: left,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: borderR(8),
                border: Border.all(
                  color: const Color(0xffD5D5D5),
                  width: 1,
                )),
            child: TextField(
              onChanged: (val) {
                inputText = val;
              },
              keyboardType: keyboard ?? TextInputType.name,
              decoration: const InputDecoration(
                // suffix: Icon(Icons.remove_red_eye),
                // labelText: 'Email address',
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey),
                // errorText: validmail(email),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropdown(context) {
    return Padding(
      padding: pSymmetric(10, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          inputName(),
          hspacer(5),
          Container(
            width: width(context),
            height: 48,
            alignment: left,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: borderR(8),
                border: Border.all(
                  color: const Color(0xffD5D5D5),
                  width: 1,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                input(grey61, 14, inputText!, w500),
                Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                  color: grey61,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
