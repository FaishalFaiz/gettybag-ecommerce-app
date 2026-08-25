import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pengaturan detail profil sedang dikembangkan')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Card
            _buildProfileHeader(context),
            const SizedBox(height: 12),

            // Profile Stats Section
            _buildProfileStats(),
            const SizedBox(height: 24),

            // Profile Settings Section
            _buildSettingsList(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.surfaceSoft,
              child: const Icon(
                Icons.person_rounded,
                size: 40,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kUser['name'],
                  style: AppTextStyles.displaySm(color: Colors.white).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  kUser['email'],
                  style: AppTextStyles.captionSm(color: Colors.white.withValues(alpha: 0.7)),
                ),
                const SizedBox(height: 4),
                Text(
                  kUser['phone'],
                  style: AppTextStyles.captionSm(color: Colors.white.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.hairline),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Pesanan', kUser['orderCount'].toString(), Icons.local_shipping_outlined),
              Container(height: 30, width: 1, color: AppColors.hairline),
              _buildStatItem('Wishlist', kUser['wishlistCount'].toString(), Icons.favorite_border),
              Container(height: 30, width: 1, color: AppColors.hairline),
              _buildStatItem('Ulasan', kUser['reviewCount'].toString(), Icons.rate_review_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.titleMd().copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppTextStyles.captionSm(),
        ),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            context,
            icon: Icons.person_outline_rounded,
            title: 'Edit Profil',
            subtitle: 'Nama, email, nomor hp, dan alamat',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.lock_outline_rounded,
            title: 'Keamanan Akun',
            subtitle: 'Ubah password dan verifikasi dua langkah',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.location_on_outlined,
            title: 'Daftar Alamat',
            subtitle: 'Alamat pengiriman belanjaan buku',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.help_outline_rounded,
            title: 'Bantuan & Dukungan',
            subtitle: 'Hubungi tim operasional CS GettyBag',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsTile(
            context,
            icon: Icons.logout_rounded,
            title: 'Keluar',
            subtitle: 'Keluar dari sesi akun ini',
            titleColor: AppColors.error,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? titleColor,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (titleColor == AppColors.error ? AppColors.error : AppColors.primary)
              .withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: titleColor ?? AppColors.primary,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.titleSm().copyWith(
          fontWeight: FontWeight.w700,
          color: titleColor ?? AppColors.ink,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.captionSm(),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.muted,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Konfirmasi Keluar',
            style: AppTextStyles.displaySm(),
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari GettyBag?',
            style: AppTextStyles.bodyMd(),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Batal',
                style: AppTextStyles.buttonSm(color: AppColors.muted),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, kRouteLogin);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
                minimumSize: const Size(88, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Keluar',
                style: AppTextStyles.buttonSm(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
