import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  String _selectedAvatar = 'assets/images/profile.png'; // Default avatar

  final List<String> _avatars = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

  void _openAvatarPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _avatars.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAvatar = _avatars[index];
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(_avatars[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _resetPassword() {
    // TODO: Implement reset password logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Reset password link sent!')));
  }

  void _deleteAccount() {
    // TODO: Implement delete account logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account deleted successfully!')),
    );
  }

  void _updateData() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement update data logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Pick Avatar',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar Section
              GestureDetector(
                onTap: _openAvatarPicker,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_selectedAvatar),
                ),
              ),
              const SizedBox(height: 20),

              // Username Box
              TextFormField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.yellow),
                decoration: InputDecoration(
                  labelText: 'Insert Username',
                  labelStyle: const TextStyle(color: Colors.yellow),
                  prefixIcon: const Icon(Icons.person, color: Colors.yellow),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Mobile Number Box
              TextFormField(
                controller: _mobileNumberController,
                style: const TextStyle(color: Colors.yellow),
                decoration: InputDecoration(
                  labelText: 'Insert Mobile Number',
                  labelStyle: const TextStyle(color: Colors.yellow),
                  prefixIcon: const Icon(Icons.phone, color: Colors.yellow),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Reset Password Option
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: _resetPassword,
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
              const Spacer(),

              // Bottom Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _deleteAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _updateData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'Update Data',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
