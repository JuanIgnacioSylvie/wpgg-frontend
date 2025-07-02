import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wpgg/ui/common/widgets/loading_widget.dart';
import 'package:wpgg/ui/common/widgets/profile_card.dart';
import 'package:wpgg/ui/common/widgets/match_summary_card.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.white,
        child: viewModel.isBusy
            ? const LoadingWidget()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (viewModel.profile != null)
                      ProfileCard(profile: viewModel.profile!),
                    const SizedBox(height: 16),
                    ListView.builder(
                      itemCount: viewModel.matches.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          MatchSummaryCard(match: viewModel.matches[index]),
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
