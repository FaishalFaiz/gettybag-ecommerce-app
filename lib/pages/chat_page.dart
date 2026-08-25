import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  String _activeFilter = 'Semua';

  @override
  Widget build(BuildContext context) {
    // Filter chats based on selected filter
    final filteredChats = _activeFilter == 'Semua'
        ? kChatList
        : kChatList.where((chat) => (chat['unreadCount'] as int) > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur pencarian chat sedang dikembangkan')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips style Airbnb
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: AppColors.canvas,
              border: Border(
                bottom: BorderSide(color: AppColors.hairline),
              ),
            ),
            child: Row(
              children: [
                _buildFilterChip('Semua'),
                const SizedBox(width: 8),
                _buildFilterChip('Belum Dibaca'),
              ],
            ),
          ),

          // Chat List View
          Expanded(
            child: filteredChats.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    itemCount: filteredChats.length,
                    separatorBuilder: (context, index) => const Divider(
                      indent: 80,
                      endIndent: 16,
                    ),
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];
                      final unreadCount = chat['unreadCount'] as int;
                      final isOnline = chat['isOnline'] as bool;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: AppColors.surfaceStrong,
                              backgroundImage: AssetImage('assets/images/${chat['imageIndex']}.jpg'),
                            ),
                            if (isOnline)
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: AppColors.success,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.canvas,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                chat['storeName'],
                                style: AppTextStyles.titleMd().copyWith(
                                  fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              chat['time'],
                              style: AppTextStyles.captionSm().copyWith(
                                fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.normal,
                                color: unreadCount > 0 ? AppColors.primary : AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  chat['lastMessage'],
                                  style: AppTextStyles.bodySm().copyWith(
                                    color: unreadCount > 0 ? AppColors.ink : AppColors.muted,
                                    fontWeight: unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (unreadCount > 0) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: AppColors.badge,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 20,
                                    minHeight: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$unreadCount',
                                      style: AppTextStyles.badge(color: Colors.white).copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        onTap: () {
                          // Navigate to Chat detail placeholder
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Membuka percakapan dengan ${chat['storeName']}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _activeFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _activeFilter = label;
          });
        }
      },
      backgroundColor: AppColors.surfaceSoft,
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.buttonSm(
        color: isSelected ? Colors.white : AppColors.body,
      ).copyWith(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.surfaceStrong,
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 36,
                color: AppColors.muted,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tidak Ada Pesan',
              style: AppTextStyles.displaySm(),
            ),
            const SizedBox(height: 8),
            Text(
              'Pesanan atau pertanyaanmu dengan penjual toko buku akan tampil di sini.',
              style: AppTextStyles.bodySm(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
