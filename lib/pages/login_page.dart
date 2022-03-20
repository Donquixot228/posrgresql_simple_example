import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();
  static const String routeName = '/loginPage';

  static Widget create() {
    return const LoginPage();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//final _formKey = GlobalKey<FormState>();
//   late String phoneNumber;
//   late String email;
//   late String password;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: NoteFormWidget(
//         email: email,
//         password: password,
//         phoneNumber: phoneNumber,
//         onChangedEmail: (email) => setState(
//           () => this.email = email,
//         ),
//         onChangedPassword: (password) => setState(
//           () => this.password = password,
//         ),
//         onChangedPhoneNumber: (phoneNumber) => setState(
//           () => this.phoneNumber = phoneNumber,
//         ),
//       ),
//     );
//   }