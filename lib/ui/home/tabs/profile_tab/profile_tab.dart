import 'package:evently_c20/core/resources/routes_manager.dart';
import 'package:evently_c20/core/reusable_components/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: "Logout", onClick: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, RoutesManager.signIn);
        },)
      ],
    );
  }
}
