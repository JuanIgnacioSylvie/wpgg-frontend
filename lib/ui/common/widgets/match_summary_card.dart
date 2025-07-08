import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/participant.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'wpgg_card.dart';

class MatchSummaryCard extends StatefulWidget {
  final MatchSummaryDTO match;
  final String? playerPuuid;
  const MatchSummaryCard({super.key, required this.match, this.playerPuuid});

  @override
  State<MatchSummaryCard> createState() => _MatchSummaryCardState();
}

class _MatchSummaryCardState extends State<MatchSummaryCard> {
  bool _expanded = false;

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    ParticipantDTO? participant;
    if (widget.match.participants?.isNotEmpty == true) {
      if (widget.playerPuuid != null) {
        participant = widget.match.participants!.firstWhere(
            (p) => p.accountDto?.puuid == widget.playerPuuid,
            orElse: () => widget.match.participants!.first);
      } else {
        participant = widget.match.participants!.first;
      }
    }
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
                    Row(
                      children: [
                        Text(
                          'Dur: ${(widget.match.gameDuration ?? 0) ~/ 60}m',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Hace: N/A',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('#${widget.match.queueId ?? '-'}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          if (participant != null)
            _buildParticipantSummary(participant, ddragon),
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

  Widget _buildParticipantSummary(ParticipantDTO p, DDragonService ddragon) {
    final kda = p.deaths == 0
        ? ((p.kills ?? 0) + (p.assists ?? 0)).toDouble()
        : ((p.kills ?? 0) + (p.assists ?? 0)) / (p.deaths ?? 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'K/D/A: ${p.kills}/${p.deaths}/${p.assists} (KDA: ${kda.toStringAsFixed(1)})',
        ),
        const SizedBox(height: 4),
        _buildBuildSummary(p, ddragon),
      ],
    );
  }

  Widget _buildParticipantDetail(ParticipantDTO p, DDragonService ddragon) {
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
            subtitle: Text('K/D/A: ${p.kills}/${p.deaths}/${p.assists}'),
            trailing: Text(p.win == true ? 'Win' : 'Loss'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72),
            child: _buildBuildSummary(p, ddragon),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildSummary(ParticipantDTO p, DDragonService ddragon) {
    final spells = [
      ddragon.summonerSpellIcon(p.summonerSpellsDto?.summoner1Id),
      ddragon.summonerSpellIcon(p.summonerSpellsDto?.summoner2Id),
    ]..removeWhere((e) => e == null);

    final items = [
      p.buildDto?.item0,
      p.buildDto?.item1,
      p.buildDto?.item2,
      p.buildDto?.item3,
      p.buildDto?.item4,
      p.buildDto?.item5,
      p.buildDto?.item6,
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: spells
                  .map((url) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Image.network(
                          url!,
                          width: 20,
                          height: 20,
                          errorBuilder: (c, e, s) =>
                              const SizedBox(width: 20, height: 20),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Runas N/A',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 2,
              alignment: WrapAlignment.center,
              children: items
                  .where((id) => id != null && id! > 0)
                  .map((id) => Image.network(
                        ddragon.itemIcon(id!),
                        width: 20,
                        height: 20,
                        errorBuilder: (c, e, s) =>
                            const SizedBox(width: 20, height: 20),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
