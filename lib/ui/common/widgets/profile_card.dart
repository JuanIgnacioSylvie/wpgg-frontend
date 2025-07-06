import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class ProfileCard extends StatelessWidget {
  final ProfileAccountDTO profile;
  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final ddragon = locator<DDragonService>();
    return WpggCard(
      child: Row(
        children: [
          if (profile.profileIconId != null)
            Image.network(
              ddragon.profileIcon(profile.profileIconId!),
              width: 48,
              height: 48,
              errorBuilder: (c, e, s) => const SizedBox(width: 48, height: 48),
            ),
          if (profile.profileIconId != null) const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Summoner Level: ${profile.summonerLevel ?? '-'}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Profile ID: ${profile.id ?? '-'}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
