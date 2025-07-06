import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/participant.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class MatchSummaryCard extends StatefulWidget {
  final MatchSummaryDTO match;
  const MatchSummaryCard({super.key, required this.match});

  @override
  State<MatchSummaryCard> createState() => _MatchSummaryCardState();
}

class _MatchSummaryCardState extends State<MatchSummaryCard> {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    final participant = widget.match.participants?.isNotEmpty == true
        ? widget.match.participants!.first
        : null;
    final ddragon = locator<DDragonService>();

    return WpggCard(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              Text('#${widget.match.queueId ?? '-'}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          if (participant != null) _buildParticipantSummary(participant, ddragon),
          if (_expanded) ...[
            const Divider(),
            Column(
              children: widget.match.participants
                      ?.map((p) => _buildParticipantDetail(p, ddragon))
                      .toList() ??
                  [],
            ),
          ],
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(_expanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onPressed: _toggle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantSummary(
      ParticipantDTO p, DDragonService ddragon) {
    final build = p.buildDto;
    final items = [
      build?.item0,
      build?.item1,
      build?.item2,
      build?.item3,
      build?.item4,
      build?.item5,
      build?.item6,
    ];

    return Row(
      children: [
        Text('K/D/A: ${p.kills}/${p.deaths}/${p.assists}'),
        const SizedBox(width: 8),
        Wrap(
          spacing: 4,
          children: items
              .where((id) => id != null && id! > 0)
              .map((id) => Image.network(
                    ddragon.itemIcon(id!),
                    width: 24,
                    height: 24,
                    errorBuilder: (c, e, s) =>
                        const SizedBox(width: 24, height: 24),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildParticipantDetail(
      ParticipantDTO p, DDragonService ddragon) {
    final items = [
      p.buildDto?.item0,
      p.buildDto?.item1,
      p.buildDto?.item2,
      p.buildDto?.item3,
      p.buildDto?.item4,
      p.buildDto?.item5,
      p.buildDto?.item6,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
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
            subtitle:
                Text('K/D/A: ${p.kills}/${p.deaths}/${p.assists}'),
            trailing: Text(p.win == true ? 'Win' : 'Loss'),
          ),
          if (items.any((id) => id != null && id! > 0))
            Padding(
              padding: const EdgeInsets.only(left: 72),
              child: Wrap(
                spacing: 4,
                children: items
                    .where((id) => id != null && id! > 0)
                    .map((id) => Image.network(
                          ddragon.itemIcon(id!),
                          width: 24,
                          height: 24,
                          errorBuilder: (c, e, s) =>
                              const SizedBox(width: 24, height: 24),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
