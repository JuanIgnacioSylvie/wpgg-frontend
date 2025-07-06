import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class MatchSummaryCard extends StatefulWidget {
  final MatchSummaryDTO match;
  const MatchSummaryCard({super.key, required this.match});

  @override
  State<MatchSummaryCard> createState() => _MatchSummaryCardState();
}

class _MatchSummaryCardState extends State<MatchSummaryCard> {
  @override
  Widget build(BuildContext context) {
    final participant = widget.match.participants?.isNotEmpty == true
        ? widget.match.participants!.first
        : null;
    final ddragon = locator<DDragonService>();

    return WpggCard(
      padding: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Row(
          children: [
            if (participant?.championName != null)
              Image.network(
                ddragon.championIcon(participant!.championName!),
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox(width: 40, height: 40),
              ),
            if (participant?.championName != null) const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.match.gameModeDto?.map ?? 'N/A',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Duration: ${(widget.match.gameDuration ?? 0) ~/ 60}m',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
        trailing: Text('#${widget.match.queueId ?? '-'}',
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
        children: [
          Column(
            children: widget.match.participants
                    ?.map(
                      (p) => ListTile(
                        leading: p.championName != null
                            ? Image.network(
                                ddragon.championIcon(p.championName!),
                                width: 32,
                                height: 32,
                                errorBuilder: (c, e, s) =>
                                    const SizedBox(width: 32, height: 32),
                              )
                            : null,
                        title: Text(p.accountDto?.gameName ?? '-'),
                        subtitle: Text('K/D/A: ${p.kills}/${p.deaths}/${p.assists}'),
                        trailing: Text(p.win == true ? 'Win' : 'Loss'),
                      ),
                    )
                    .toList() ??
                [],
          )
        ],
      ),
    );
  }
}
