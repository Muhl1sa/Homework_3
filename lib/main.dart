import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/course_list': (context) => CourseListScreen(),
        '/course_detail': (context) => CourseDetailScreen(),
        '/assignments': (context) => AssignmentsScreen(),
        '/user_profile': (context) => UserProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Learning Management System',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color(0xff2c4114),
              backgroundColor: Colors.lightGreen,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/course_list');
            },
            child: Text('Explore Courses'),
          ),
        ],
      ),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Course ${index + 1}'),
            subtitle: Text('Description of Course ${index + 1}'),
            onTap: () {
              Navigator.pushNamed(context, '/course_detail', arguments: {
                'courseTitle': 'Course ${index + 1}',
                'courseDescription': 'Description of Course ${index + 1}',
              });
            },
          );
        },
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(args?['courseTitle'] ?? ''),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            args?['courseDescription'] ?? '',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color(0xff2c4114),
              backgroundColor: Colors.lightGreen,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/assignments', arguments: {
                'courseTitle': args?['courseTitle'] ?? '',
              });
            },
            child: Text('View Assignments'),
          ),
        ],
      ),
    );
  }
}

class AssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Assignments - ${args?['courseTitle']}'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Assignment ${index + 1}'),
            subtitle: Text('Description of Assignment ${index + 1}'),
            onTap: () {
              // Handle assignment selection
            },
          );
        },
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            // Add user profile image here
          ),
          SizedBox(height: 20),
          Text(
            'User Name',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color(0xff352020),
            ),
          ),
          Text(
            'user@email.com',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color(0xff2c4114),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add logout functionality
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
