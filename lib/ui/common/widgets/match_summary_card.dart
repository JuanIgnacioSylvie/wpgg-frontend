import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class MatchSummaryCard extends StatelessWidget {
  final MatchSummaryDTO match;
  const MatchSummaryCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final participant = match.participants?.isNotEmpty == true
        ? match.participants!.first
        : null;
    final ddragon = locator<DDragonService>();

    return WpggCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (participant?.championName != null)
            Image.network(
              ddragon.championIcon(participant!.championName!),
              width: 48,
              height: 48,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(width: 48, height: 48),
            ),
          if (participant?.championName != null) const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(match.gameModeDto?.map ?? 'N/A',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Duration: ${(match.gameDuration ?? 0) ~/ 60}m',
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text('#${match.queueId ?? '-'}',
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
