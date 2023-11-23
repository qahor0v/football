import 'package:flutter/material.dart';
import 'package:football/models/event_model.dart';

class EventScreen extends StatelessWidget {
  final EventModel event;

  const EventScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  event.leagueLogo ?? "",
                  height: 32,
                  width: 32,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                event.leagueName ?? "",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Image.network(
                    event.teamHomeBadge ?? "",
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.matchHometeamName ?? "",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    "${event.matchHometeamFtScore}:${event.matchAwayteamFtScore}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                children: [
                  Image.network(
                    event.teamAwayBadge ?? "",
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.matchAwayteamName ?? "",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
