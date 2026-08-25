import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../../widgets/common/gettybag_logo.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int unreadChats;
  final VoidCallback onChatTap;

  const HomeAppBar({
    super.key,
    this.unreadChats = 3,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const GettyBagLogo(size: 34),
          const SizedBox(width: 8),
          const GettyBagWordmark(fontSize: 20),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline_rounded, size: 26, color: AppColors.primary),
                onPressed: onChatTap,
              ),
              if (unreadChats > 0)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.badge,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Center(
                      child: Text(
                        unreadChats > 9 ? '9+' : '$unreadChats',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
