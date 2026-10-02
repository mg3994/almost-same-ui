import 'package:flutter/material.dart';

class TopTitleBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onAvatarTap;

  const TopTitleBar({
    Super.key,
    required this.searchController,
    required this.onSearchChanged,
    this.onAvatarTap,
  });

  Widget _buildMsLogo() {
    return SizedBox(
      width: 16,
      height: 16,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(color: const Color(0xFFF25022)),
          Container(color: const Color(0xFF7FBA00)),
          Container(color: const Color(0xFF00A4EF)),
          Container(color: const Color(0xFFFFB900)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: 44,
      color: const Color(0xFFF3F3F3),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          // Left: App brand & title
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMsLogo(),
              const SizedBox(width: 10),
              if (!isMobile)
                const Text(
                  'Microsoft Store',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF242424),
                  ),
                ),
            ],
          ),
          if (!isMobile) const SizedBox(width: 24),

          // Center: Search bar
          Expanded(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 440),
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFD6D6D6)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        style: const TextStyle(fontSize: 13, color: Color(0xFF1B1B1B)),
                        decoration: const InputDecoration(
                          hintText: 'video editor',
                          hintStyle: TextStyle(fontSize: 13, color: Color(0xFF5F5F5F)),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xFF5F5F5F),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right: Profile & window controls
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              // Profile Avatar
              InkWell(
                onTap: onAvatarTap,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'MS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3B3B3B),
                    ),
                  ),
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 8),
                _buildWindowButton(Icons.remove, onTap: () {}),
                _buildWindowButton(Icons.crop_square, iconSize: 12, onTap: () {}),
                _buildWindowButton(
                  Icons.close,
                  hoverColor: const Color(0xFFC42B1C),
                  hoverIconColor: Colors.white,
                  onTap: () {},
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWindowButton(
    IconData icon, {
    double iconSize = 14,
    Color? hoverColor,
    Color? hoverIconColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2),
      child: Container(
        width: 38,
        height: 32,
        alignment: Alignment.center,
        child: Icon(icon, size: iconSize, color: const Color(0xFF1B1B1B)),
      ),
    );
  }
}
