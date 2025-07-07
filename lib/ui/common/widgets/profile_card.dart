import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'package:wpgg/models/player_rank.dto.dart';
import 'package:wpgg/models/stats.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class ProfileCard extends StatelessWidget {
  final ProfileAccountDTO profile;
  final PlayerRankDTO? ranks;
  final StatsDTO? stats;
  const ProfileCard({super.key, required this.profile, this.ranks, this.stats});

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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                if (ranks?.rankedSoloQ != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'SoloQ: ${ranks!.rankedSoloQ!.tier ?? ''} ${ranks!.rankedSoloQ!.rank ?? ''} (${ranks!.rankedSoloQ!.leaguePoints ?? 0} LP)',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
                if (ranks?.rankedFlex != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Flex: ${ranks!.rankedFlex!.tier ?? ''} ${ranks!.rankedFlex!.rank ?? ''} (${ranks!.rankedFlex!.leaguePoints ?? 0} LP)',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
                if (stats?.summary?.winRate != null) ...[
                  const SizedBox(height: 8),
                  Text(
                      'Winrate: ${stats!.summary!.winRate!.toStringAsFixed(1)}%',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
