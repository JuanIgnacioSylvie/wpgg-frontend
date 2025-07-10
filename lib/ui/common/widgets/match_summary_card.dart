// lib/widgets/match_summary_card.dart
import 'package:flutter/material.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/participant.dto.dart';
import 'package:wpgg/services/ddragon_service.dart';

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

  // -------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final ddragon = locator<DDragonService>();

    // ── participante principal (el usuario) ─────────────────────
    ParticipantDTO? me;
    if (widget.match.participants?.isNotEmpty == true) {
      me = widget.match.participants!.firstWhere(
        (p) => p.accountDto?.puuid == widget.playerPuuid,
        orElse: () => widget.match.participants!.first,
      );
    }

    // ── colores por resultado ───────────────────────────────────
    final bool myTeamWon = me?.win == true;
    final Color bgColor = myTeamWon
        ? const Color(0xFFB9D7F5) // azul victoria
        : const Color(0xFFF5C5C5); // rojo derrota

    // ── contenedor principal ────────────────────────────────────
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildCompact(me, ddragon),
          if (_expanded) const SizedBox(height: 6),
          if (_expanded) _buildExpanded(ddragon),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              padding: EdgeInsets.zero,
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

  // -------------------------------------------------------------
  // VISTA COMPACTA
  // -------------------------------------------------------------
  Widget _buildCompact(ParticipantDTO? me, DDragonService dd) {
    if (me == null) return const SizedBox.shrink();

    final double kdaRatio = me.deaths == 0
        ? (me.kills ?? 0 + (me.assists ?? 0)).toDouble()
        : (me.kills ?? 0 + (me.assists ?? 0)) / (me.deaths ?? 1);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Icono de campeón ────────────────────────────────────
        Image.network(
          dd.championIcon(me.championName ?? ''),
          width: 48,
          height: 48,
          errorBuilder: (_, __, ___) => const SizedBox(width: 48, height: 48),
        ),
        const SizedBox(width: 6),
        // ── Hechizos y runas ─────────────────────────────────────
        Column(
          children: [
            Image.network(
              dd.summonerSpellIcon(me.summonerSpellsDto?.summoner1Id) ?? '',
              width: 20,
              height: 20,
              errorBuilder: (_, __, ___) =>
                  const SizedBox(width: 20, height: 20),
            ),
            const SizedBox(height: 2),
            Image.network(
              dd.summonerSpellIcon(me.summonerSpellsDto?.summoner2Id) ?? '',
              width: 20,
              height: 20,
              errorBuilder: (_, __, ___) =>
                  const SizedBox(width: 20, height: 20),
            ),
          ],
        ),
        const SizedBox(width: 6),
        Column(
          children: [
            // runa principal
            Image.network(
              dd.runeIcon(
                      me.runesDto?.styles?.first.selections?.first.perk ?? 0) ??
                  '',
              width: 20,
              height: 20,
              errorBuilder: (_, __, ___) =>
                  const SizedBox(width: 20, height: 20),
            ),
            const SizedBox(height: 2),
            // runa secundaria
            if ((me.runesDto?.styles?.length ?? 0) > 1)
              Image.network(
                dd.runeIcon(me.runesDto?.styles?[1].style ?? 0) ?? '',
                width: 20,
                height: 20,
                errorBuilder: (_, __, ___) =>
                    const SizedBox(width: 20, height: 20),
              ),
          ],
        ),
        const SizedBox(width: 10),
        // ── KDA y ratio ─────────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${me.kills}/${me.deaths}/${me.assists}",
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              me.deaths == 0
                  ? "Perfect KDA"
                  : "${kdaRatio.toStringAsFixed(1)}:1 KDA",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        // ── Info de partida ─────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.match.gameModeDto?.map ?? 'N/A',
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Dur: ${(widget.match.gameDuration ?? 0) ~/ 60}m",
              style: const TextStyle(fontFamily: 'Roboto', fontSize: 12),
            ),
            const Text("Hace: N/A",
                style: TextStyle(fontFamily: 'Roboto', fontSize: 12)),
          ],
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // VISTA EXPANDIDA
  // -------------------------------------------------------------
  Widget _buildExpanded(DDragonService dd) {
    final blue =
        widget.match.participants?.where((p) => p.teamId == 100).toList() ?? [];
    final red =
        widget.match.participants?.where((p) => p.teamId == 200).toList() ?? [];

    Widget section(String title, List<ParticipantDTO> list, Color color) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: color)),
          const SizedBox(height: 4),
          ...list.map((p) => _playerRow(p, dd)),
          const SizedBox(height: 6),
        ],
      );
    }

    final bool blueWon =
        widget.match.participants?.firstWhere((p) => p.teamId == 100).win ??
            false;

    return Column(
      children: [
        section(
          blueWon ? "Victoria (Lado azul)" : "Derrota (Lado azul)",
          blue,
          blueWon ? Colors.blueAccent : Colors.redAccent,
        ),
        section(
          !blueWon ? "Victoria (Lado rojo)" : "Derrota (Lado rojo)",
          red,
          !blueWon ? Colors.blueAccent : Colors.redAccent,
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // FILA DE JUGADOR EN VISTA EXPANDIDA
  // -------------------------------------------------------------
  Widget _playerRow(ParticipantDTO p, DDragonService dd) {
    final kda = p.deaths == 0
        ? (p.kills ?? 0 + (p.assists ?? 0)).toDouble()
        : (p.kills ?? 0 + (p.assists ?? 0)) / (p.deaths ?? 1);

    final spells = [
      dd.summonerSpellIcon(p.summonerSpellsDto?.summoner1Id),
      dd.summonerSpellIcon(p.summonerSpellsDto?.summoner2Id),
    ];

    final runes = [
      dd.runeIcon(p.runesDto?.styles?.first.selections?.first.perk ?? 0),
      if ((p.runesDto?.styles?.length ?? 0) > 1)
        dd.runeIcon(p.runesDto?.styles?[1].style ?? 0),
    ];

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
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              // Campeón
              if (p.championName != null)
                Image.network(
                  dd.championIcon(p.championName!),
                  width: 20,
                  height: 20,
                  errorBuilder: (_, __, ___) =>
                      const SizedBox(width: 20, height: 20),
                ),
              const SizedBox(width: 4),
              // Hechizos
              Column(
                children: spells
                    .where((e) => e != null)
                    .map((s) => Image.network(
                          s!,
                          width: 14,
                          height: 14,
                          errorBuilder: (_, __, ___) =>
                              const SizedBox(width: 14, height: 14),
                        ))
                    .toList(),
              ),
              const SizedBox(width: 4),
              // Runas
              Column(
                children: runes
                    .where((e) => e != null)
                    .map((r) => Image.network(
                          r!,
                          width: 14,
                          height: 14,
                          errorBuilder: (_, __, ___) =>
                              const SizedBox(width: 14, height: 14),
                        ))
                    .toList(),
              ),
              const SizedBox(width: 6),
              // Nombre del invocador
              Expanded(
                child: Text(
                  p.accountDto?.gameName ?? '-',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontFamily: 'Roboto', fontSize: 12),
                ),
              ),
              // Resultado
              Text(p.win == true ? 'Win' : 'Loss',
                  style: const TextStyle(fontFamily: 'Roboto', fontSize: 12)),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(width: 38), // sangría para alinear con íconos
              Text(
                "${p.kills}/${p.deaths}/${p.assists}  •  ${kda.toStringAsFixed(1)} KDA",
                style: const TextStyle(fontFamily: 'Roboto', fontSize: 11),
              ),
              const Spacer(),
              Wrap(
                spacing: 2,
                children: items
                    .where((id) => id != null && id! > 0)
                    .map((id) => Image.network(
                          dd.itemIcon(id!),
                          width: 16,
                          height: 16,
                          errorBuilder: (_, __, ___) =>
                              const SizedBox(width: 16, height: 16),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
