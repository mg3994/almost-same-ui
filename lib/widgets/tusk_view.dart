import 'package:flutter/material.dart';
import 'tusk_sign_in_dialog.dart';

class TuskView extends StatelessWidget {
  final VoidCallback onBackToStore;

  const TuskView({
    Super.key,
    required this.onBackToStore,
  });

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFFA1A1AA)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFA1A1AA),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      body: SafeArea(
        child: Column(
          children: [
            // Top Announcement Banner
            Container(
              height: 36,
              color: const Color(0xFF003366),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'tuskcentral.ai has moved to new.tusksearch.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  // Left Sidebar
                  Container(
                    width: 200,
                    color: const Color(0xFF18181B),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Brand Logo
                        Row(
                          children: [
                            const Icon(
                              Icons.all_inclusive,
                              color: Color(0xFFE11D48),
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'tusk',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                              decoration: BoxDecoration(
                                color: const Color(0xFF27272A),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'BETA',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFFA1A1AA),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),

                        // Sidebar items
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_outlined, size: 16),
                          label: const Text('New Chat', style: TextStyle(fontSize: 13)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF27272A),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            alignment: Alignment.centerLeft,
                            minimumSize: const Size(double.infinity, 38),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          'Recents',
                          style: TextStyle(fontSize: 12, color: Color(0xFFA1A1AA)),
                        ),
                        const Spacer(),

                        // Back to Store Switcher Button
                        OutlinedButton.icon(
                          onPressed: onBackToStore,
                          icon: const Icon(Icons.storefront, size: 16),
                          label: const Text('Microsoft Store', style: TextStyle(fontSize: 12)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF3F3F46)),
                            minimumSize: const Size(double.infinity, 36),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Sign In Trigger Button
                        OutlinedButton.icon(
                          onPressed: () => TuskSignInDialog.show(context),
                          icon: const Icon(Icons.login, size: 16),
                          label: const Text('Sign In', style: TextStyle(fontSize: 13)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF3F3F46)),
                            minimumSize: const Size(double.infinity, 38),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Tusk Search Area
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(32),
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 720),
                              child: Column(
                                children: [
                                  // Main Heading
                                  const Text(
                                    'Search and unlimited.',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 28),

                                  // Central Search Bar Box
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF18181B),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: const Color(0xFF27272A)),
                                    ),
                                    child: Column(
                                      children: [
                                        const TextField(
                                          style: TextStyle(color: Colors.white, fontSize: 14),
                                          decoration: InputDecoration(
                                            hintText: 'Ask anything...',
                                            hintStyle: TextStyle(color: Color(0xFFA1A1AA)),
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.add, color: Color(0xFFA1A1AA), size: 20),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF27272A),
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Text(
                                                        'GPT-5 N',
                                                        style: TextStyle(fontSize: 12, color: Colors.white),
                                                      ),
                                                      SizedBox(width: 4),
                                                      Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                IconButton(
                                                  icon: const Icon(Icons.mic, color: Color(0xFFA1A1AA), size: 20),
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.graphic_eq, color: Color(0xFFA1A1AA), size: 20),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 28),

                                  // 4 Feature Cards Grid
                                  GridView.count(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 2.2,
                                    children: [
                                      _buildFeatureCard(
                                        icon: Icons.diamond_outlined,
                                        title: 'Models & Credits',
                                        description: 'Access more with free credits. Log in to claim 1,000 credits to access more models.',
                                      ),
                                      _buildFeatureCard(
                                        icon: Icons.image_outlined,
                                        title: 'Create with Image Generation',
                                        description: 'Create high-quality visuals from simple prompts. Explore ideas and bring creative projects.',
                                      ),
                                      _buildFeatureCard(
                                        icon: Icons.psychology_outlined,
                                        title: 'Let Brainiac choose the best model',
                                        description: 'Automatically picks the best AI model for your prompt, so you don\'t have to choose.',
                                      ),
                                      _buildFeatureCard(
                                        icon: Icons.graphic_eq,
                                        title: 'Talk It Out with Voice Mode',
                                        description: 'Talk naturally with Voice Mode for a faster, more conversational experience.',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Floating Trigger Modal Button for testing
                        Positioned(
                          top: 16,
                          right: 16,
                          child: ElevatedButton(
                            onPressed: () => TuskSignInDialog.show(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE11D48),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Open Sign-In Dialog'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
