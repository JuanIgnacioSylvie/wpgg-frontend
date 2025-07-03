import 'package:flutter/material.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'wpgg_card.dart';

class ProfileCard extends StatelessWidget {
  final ProfileAccountDTO profile;
  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return WpggCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summoner Level: ${profile.summonerLevel}',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Profile ID: ${profile.id}',
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
