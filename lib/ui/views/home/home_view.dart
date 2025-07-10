import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wpgg/ui/common/app_colors.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/services/theme_service.dart';
import 'package:wpgg/ui/common/widgets/wpgg_logo.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final themeService = locator<ThemeService>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (themeService.themeMode == ThemeMode.light &&
          !themeService.promptShown) {
        _showThemePanel(context, themeService);
        themeService.markPromptShown();
      }
    });

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const WpggLogo(width: 450),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: viewModel.gameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                              hintText: 'Game name or Champion',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 80,
                          child: TextField(
                            controller: viewModel.tagController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                              hintText: 'Tag',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: viewModel.search,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Search'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: viewModel.searchChampion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Search Champion'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showThemePanel(BuildContext context, ThemeService themeService) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'theme-panel',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 250,
              child: _themePanelContent(context, themeService),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Widget _themePanelContent(BuildContext context, ThemeService themeService) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('lucian-dark-mode.png', width: 180),
        const SizedBox(height: 16),
        const Text('¿Preferís el dark mode?'),
        Switch(
          value: themeService.themeMode == ThemeMode.dark,
          onChanged: (val) {
            themeService.toggleTheme();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
