import 'package:flutter/material.dart';
import 'package:wpgg/models/gameplay_recommendation.dto.dart';
import 'wpgg_card.dart';

class RecommendationCard extends StatelessWidget {
  final GameplayRecommendationDTO recommendation;
  const RecommendationCard({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return WpggCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended Role: ${recommendation.role ?? '-'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Champion: ${recommendation.champion ?? '-'}',
              style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text(recommendation.summary ?? '',
              style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
