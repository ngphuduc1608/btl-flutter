import 'package:flutter/material.dart';
import 'package:notes_app/services/auth/auth_service.dart';

Future<void> showProfileDialog(BuildContext context) {
  final user = AuthService.firebase().currentUser!;
  final email = user.email;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Profile Information'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Email: $email'),
              const SizedBox(height: 10),
              const Text('Password: ********'),
              const SizedBox(height: 10),
              const Text('For security reasons, we do not display your actual password. If you wish to change it, please use the "Forgot Password" option on the login screen.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
