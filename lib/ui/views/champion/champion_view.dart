import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'package:wpgg/ui/common/widgets/loading_widget.dart';
import 'package:wpgg/ui/common/widgets/wpgg_card.dart';

import 'champion_viewmodel.dart';

class ChampionView extends StackedView<ChampionViewModel> {
  final String championName;
  const ChampionView({Key? key, required this.championName}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ChampionViewModel viewModel, Widget? child) {
    final ddragon = locator<DDragonService>();
    return Scaffold(
      appBar: AppBar(title: Text(championName)),
      body: viewModel.isBusy
          ? const Center(child: LoadingWidget())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (viewModel.stats != null) ...[
                    WpggCard(
                      child: Row(
                        children: [
                          Image.network(
                            ddragon.championIcon(championName),
                            width: 48,
                            height: 48,
                            errorBuilder: (_, __, ___) =>
                                const SizedBox(width: 48, height: 48),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Games: ${viewModel.stats!.gamesPlayed ?? 0}'),
                              Text('Wins: ${viewModel.stats!.wins ?? 0}'),
                              Text(
                                  'Winrate: ${viewModel.stats!.winRate?.toStringAsFixed(1) ?? '-'}%'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (viewModel.stats!.bestBuild != null)
                      WpggCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...[
                              viewModel.stats!.bestBuild!.item0,
                              viewModel.stats!.bestBuild!.item1,
                              viewModel.stats!.bestBuild!.item2,
                              viewModel.stats!.bestBuild!.item3,
                              viewModel.stats!.bestBuild!.item4,
                              viewModel.stats!.bestBuild!.item5,
                              viewModel.stats!.bestBuild!.item6,
                            ].where((id) => id != null && id! > 0).map((id) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Image.network(
                                  ddragon.itemIcon(id!),
                                  width: 32,
                                  height: 32,
                                  errorBuilder: (_, __, ___) =>
                                      const SizedBox(width: 32, height: 32),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    if (viewModel.stats!.bestRunes != null)
                      WpggCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...viewModel.stats!.bestRunes!.styles
                                    ?.expand((e) => e.selections ?? [])
                                    .map((s) => s.perk)
                                    .whereType<int>()
                                    .map((id) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Image.network(
                                            ddragon.runeIcon(id)!,
                                            width: 32,
                                            height: 32,
                                            errorBuilder: (_, __, ___) =>
                                                const SizedBox(
                                                    width: 32, height: 32),
                                          ),
                                        ))
                                    .toList() ??
                                [],
                            ...[
                              viewModel.stats!.bestRunes!.statPerks?.offense,
                              viewModel.stats!.bestRunes!.statPerks?.flex,
                              viewModel.stats!.bestRunes!.statPerks?.defense,
                            ].whereType<int>().map((id) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Image.network(
                                    ddragon.runeIcon(id)!,
                                    width: 32,
                                    height: 32,
                                    errorBuilder: (_, __, ___) =>
                                        const SizedBox(width: 32, height: 32),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    if (viewModel.stats!.bestSpells != null)
                      WpggCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...[
                              viewModel.stats!.bestSpells!.summoner1Id,
                              viewModel.stats!.bestSpells!.summoner2Id,
                            ].whereType<int>().map(
                              (id) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Image.network(
                                  ddragon.summonerSpellIcon(id)!,
                                  width: 32,
                                  height: 32,
                                  errorBuilder: (_, __, ___) => const SizedBox(width: 32, height: 32),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (viewModel.stats!.bestSkillOrder != null &&
                        viewModel.stats!.bestSkillOrder!.isNotEmpty)
                      WpggCard(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(viewModel.stats!.bestSkillOrder!
                                .map((e) => _slotToLetter(e))
                                .join(' > ')),
                          ],
                        ),
                      ),
                    if (viewModel.stats!.roles != null)
                      ...viewModel.stats!.roles!.map((r) => WpggCard(
                            child: Text(
                                '${r.role}: ${r.gamesPlayed} games - ${r.winRate?.toStringAsFixed(1) ?? '-'}% WR'),
                          )),
                  ],
                ],
              ),
            ),
    );
  }

  @override
  ChampionViewModel viewModelBuilder(BuildContext context) =>
      ChampionViewModel(championName);

  @override
  void onViewModelReady(ChampionViewModel viewModel) => viewModel.loadData();

  String _slotToLetter(int slot) {
    switch (slot) {
      case 1:
        return 'Q';
      case 2:
        return 'W';
      case 3:
        return 'E';
      case 4:
        return 'R';
      default:
        return slot.toString();
    }
  }
}
