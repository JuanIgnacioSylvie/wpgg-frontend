import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wpgg/ui/common/widgets/loading_widget.dart';
import 'package:wpgg/ui/common/widgets/profile_card.dart';
import 'package:wpgg/ui/common/widgets/match_summary_card.dart';
import 'package:wpgg/ui/common/widgets/recommendation_card.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Profile'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: viewModel.isBusy
            ? LoadingWidget(progress: viewModel.loadingProgress)
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (viewModel.profile != null)
                      ProfileCard(
                        profile: viewModel.profile!,
                        ranks: viewModel.ranks,
                        stats: viewModel.stats,
                      ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.matches.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => MatchSummaryCard(
                              match: viewModel.matches[index],
                              playerPuuid: viewModel.profile?.puuid,
                            ),
                          ),
                        ),
                        if (viewModel.recommendation != null)
                          SizedBox(
                            width: 250,
                            child: RecommendationCard(
                                recommendation: viewModel.recommendation!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  void onViewModelReady(ProfileViewModel viewModel) => viewModel.loadData();
}
