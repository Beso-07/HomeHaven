import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, color: const Color(0xff757575)),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff757575),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff404040), fontSize: 12),
        enabledBorder: _textFieldBorder(),
        focusedBorder: _textFieldBorder(),
        errorBorder: _textFieldBorder(),
      ),
    );
  }

  OutlineInputBorder _textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xffE0E0E0)),
    );
  }
}
