import 'package:flutter/material.dart';
import 'models.dart';
import 'widgets/top_title_bar.dart';
import 'widgets/side_navigation.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/main_content_view.dart';
import 'widgets/tusk_view.dart';
import 'widgets/tusk_sign_in_dialog.dart';

void main() {
  runApp(const MicrosoftStoreApp());
}

class MicrosoftStoreApp extends StatelessWidget {
  const MicrosoftStoreApp({Super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microsoft Store & Tusk UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.winBg,
        fontFamily: 'Segoe UI',
      ),
      home: const StoreHomePage(),
    );
  }
}

class StoreHomePage extends StatefulWidget {
  const StoreHomePage({Super.key});

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  late final StoreViewModel _viewModel;
  late final TextEditingController _searchController;
  bool _showTuskView = false;

  @override
  void initState() {
    super.initState();
    _viewModel = StoreViewModel();
    _searchController = TextEditingController(text: 'video editor');
    _viewModel.setSearchQuery('video editor');

    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showTuskView) {
      return TuskView(
        onBackToStore: () {
          setState(() {
            _showTuskView = false;
          });
        },
      );
    }

    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.winBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top Window Bar & Search Bar with Tusk switcher / Sign-in launcher
            TopTitleBar(
              searchController: _searchController,
              onSearchChanged: (value) {
                _viewModel.setSearchQuery(value);
              },
              onAvatarTap: () {
                TuskSignInDialog.show(context);
              },
            ),

            // Mode Switcher Banner (Microsoft Store vs Tusk AI)
            Container(
              height: 32,
              color: const Color(0xFFE5E5E5),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Microsoft Store UI',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF444444)),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => TuskSignInDialog.show(context),
                        icon: const Icon(Icons.login, size: 14),
                        label: const Text('Open Tusk Modal Dialog', style: TextStyle(fontSize: 11)),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF005FB8),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showTuskView = true;
                          });
                        },
                        icon: const Icon(Icons.auto_awesome, size: 14),
                        label: const Text('Switch to Tusk UI View', style: TextStyle(fontSize: 11)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF18181B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Main Shell Content
            Expanded(
              child: Row(
                children: [
                  if (!isMobile)
                    SideNavigation(
                      selectedIndex: _viewModel.selectedNavIndex,
                      onDestinationSelected: (index) {
                        _viewModel.setSelectedNavIndex(index);
                      },
                    ),
                  Expanded(
                    child: MainContentView(viewModel: _viewModel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isMobile
          ? BottomNavigation(
              selectedIndex: _viewModel.selectedNavIndex,
              onDestinationSelected: (index) {
                _viewModel.setSelectedNavIndex(index);
              },
            )
          : null,
    );
  }
}
