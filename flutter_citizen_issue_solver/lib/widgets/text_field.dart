import 'package:citizen_issue_solver_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required TextEditingController controller,
    required this.label,
  })  : _usernameController = controller,
        super(key: key);

  final TextEditingController _usernameController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: label == 'Password',
        controller: _usernameController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          filled: true,
          fillColor: colorSwatch.shade50,
          border: InputBorder.none,
          labelText: label,
        ),
      ),
    );
  }
}
