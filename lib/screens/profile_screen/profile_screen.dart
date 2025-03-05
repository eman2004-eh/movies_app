import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Add your profile image
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'John Doe', // Replace with dynamic user data
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'john.doe@example.com', // Replace with dynamic user data
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),

            // Watchlist Section
            const Text(
              'Watchlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with dynamic watchlist data
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                        'assets/images/movie_placeholder.png'), // Add a placeholder image
                    title: Text(
                        'Movie Title $index'), // Replace with dynamic movie title
                    subtitle: const Text(
                        'Year: 2023'), // Replace with dynamic movie year
                    onTap: () {
                      // Navigate to Movie Details Screen
                    },
                  );
                },
              ),
            ),

            // Update Profile Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const Text('Update Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
