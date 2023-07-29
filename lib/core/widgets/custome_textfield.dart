import 'package:flutter/material.dart';
import 'package:mapala_unjani/core/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.label,
    this.activeColor = ColorConfig.active,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController textController;
  final FocusNode focusNode;
  final String label;
  final Color activeColor;
  Icon? suffixIcon;
  Icon? prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _requestFocus,
      controller: widget.textController,
      focusNode: widget.focusNode,
      cursorColor: widget.activeColor,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.focusNode.hasFocus
            ? widget.activeColor
            : ColorConfig.inActive,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: widget.focusNode.hasFocus
            ? widget.activeColor
            : ColorConfig.inActive,
        floatingLabelStyle: TextStyle(
          color: widget.activeColor,
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: ColorConfig.inActive,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConfig.inActive,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.activeColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
