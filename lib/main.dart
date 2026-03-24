import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Colorful App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // ✅ Main theme color
        ),
      ),
      home: const TwoButtonsLayout(),
    );
  }
}

class TwoButtonsLayout extends StatelessWidget {
  const TwoButtonsLayout({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.deepPurple, // ✅ Snackbar color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🎨 COLORED APP BAR
      appBar: AppBar(
        title: const Text(
          "My Colorful App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // ✅ AppBar color
        foregroundColor: Colors.white, // text/icon color

        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: "Menu",
          onPressed: () {
            showMessage(context, "Menu Clicked");
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {
              showMessage(context, "Search Clicked");
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: "Notifications",
            onPressed: () {
              showMessage(context, "Notifications Clicked");
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.deepPurple),
            ),
          ),
        ],
      ),

      // 🎨 BACKGROUND COLOR
      body: Container(
        color: Colors.deepPurple.shade50, // light background
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                // 🎨 LOGIN BUTTON
                ElevatedButton.icon(
                  onPressed: () {
                    showMessage(context, "Login Clicked");
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // 🎨 REGISTER BUTTON
                ElevatedButton.icon(
                  onPressed: () {
                    showMessage(context, "Register Clicked");
                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text("Register"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}