import 'package:flutter/material.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'wpgg_card.dart';

class MatchSummaryCard extends StatelessWidget {
  final MatchSummaryDTO match;
  const MatchSummaryCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return WpggCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
