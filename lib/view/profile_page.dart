import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:nbf_bookpublications_app/widgets/custom_text_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: blackColor,fontWeight: FontWeight.bold),
        ),
        backgroundColor: whiteColor,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        children: [
          SizedBox(height: screenHeight * 0.04),

          // Profile Avatar
          Center(
            child: CircleAvatar(
              radius: screenWidth * 0.18,
              backgroundImage: const NetworkImage(
                'https://randomuser.me/api/portraits/men/1.jpg', // random dummy avatar
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // First Name
          CustomTextFormField(label: 'First Name'),
          SizedBox(height: screenHeight * 0.02),
          // Last Name
          CustomTextFormField(label: 'Last Name'),


          SizedBox(height: screenHeight * 0.02),
          // Email
          CustomTextFormField(label: 'Email'),
          SizedBox(height: screenHeight * 0.02),

          // Phone Number
          CustomTextFormField(label: 'Phone Number'),


          SizedBox(height: screenHeight * 0.05),

          // Save Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: TextButton(
              onPressed: () {
                // Handle save
              },
              child: const Text(
                'Update',
                style: TextStyle(color: whiteColor, fontSize: 16),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
