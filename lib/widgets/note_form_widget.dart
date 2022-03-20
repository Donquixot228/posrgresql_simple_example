import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String email;
  final String password;
  final String phoneNumber;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedPassword;
  final ValueChanged<String> onChangedPhoneNumber;

  const NoteFormWidget({
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedPhoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildEmail() => TextFormField(
        maxLines: 1,
        initialValue: email,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (email) =>
            email != null && email.isEmpty ? 'The email cannot be empty' : null,
        onChanged: onChangedEmail,
      );

  Widget buildPassword() => TextFormField(
        maxLines: 5,
        initialValue: password,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (password) => password != null && password.isEmpty
            ? 'The password cannot be empty'
            : null,
        onChanged: onChangedPassword,
      );

  Widget buildPhoneNumber() => TextFormField(
        maxLines: 5,
        initialValue: password,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (password) => password != null && password.isEmpty
            ? 'The phoneNumber cannot be empty'
            : null,
        onChanged: onChangedPhoneNumber,
      );
}
