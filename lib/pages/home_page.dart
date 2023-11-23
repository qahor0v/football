import 'package:flutter/material.dart';
import 'package:football/services/api_services.dart';

import '../screens/event_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiServices.getEvents(
          from: "2023-11-04",
          to: "2023-11-05",
          league: "152",
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final match = snapshot.data![index];
                return EventScreen(event: match);
              },
            );
          }
        },
      ),
    );
  }
}
