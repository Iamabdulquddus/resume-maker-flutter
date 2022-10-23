import 'package:flutter/material.dart';

import '../responsive.dart';

class TextFormFeild extends StatefulWidget {
  final String? errorText;
  final String? labelText;
  final TextEditingController? controller;
  final bool editable;
  final int? maxLines;
  final int? maxLenght;
  final void Function(String)? onChange;

  const TextFormFeild({
    Key? key,
    required this.maxLines,
    this.maxLenght,
    this.errorText,
    this.labelText,
    this.controller,
    required this.editable,
    this.onChange,
  }) : super(key: key);

  @override
  State<TextFormFeild> createState() => _TextFormFeildState();
}

class _TextFormFeildState extends State<TextFormFeild> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Responsive.isMobile(context)
        ? Container(
      width: size.width/1.2,
      // height: 60,
      padding: const   EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: TextFormField(

        maxLength: widget.maxLenght,
        maxLines: widget.maxLines,
        enabled: widget.editable,
        decoration: InputDecoration(
          labelText: widget.labelText,
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          fillColor: Colors.white,
          filled: true,
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
        ),
        controller: widget.controller,
        onChanged: widget.onChange,
      ),
    )
        : Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(),
        child: TextFormField(
          maxLength: widget.maxLenght,
          maxLines: widget.maxLines,
          enabled: widget.editable,
          decoration: InputDecoration(
            labelText: widget.labelText,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            fillColor: Colors.white,
            filled: true,
            errorText: widget.errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
          ),
          controller: widget.controller,
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}
