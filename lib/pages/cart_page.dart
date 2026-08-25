import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Local list to track quantities and selection status of dummy items
  late List<Map<String, dynamic>> _items;

  @override
  void initState() {
    super.initState();
    // Clone internal data structure to allow editing state in current screen context
    _items = List<Map<String, dynamic>>.from(
      kCartItems.map((item) => Map<String, dynamic>.from(item)),
    );
  }

  int get _subtotal {
    return _items
        .where((item) => item['isSelected'] == true)
        .fold(0, (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int));
  }

  int get _shippingFee {
    return _subtotal > 0 ? 15000 : 0;
  }

  int get _total {
    return _subtotal + _shippingFee;
  }

  void _incrementQty(int index) {
    setState(() {
      _items[index]['quantity'] = (_items[index]['quantity'] as int) + 1;
    });
  }

  void _decrementQty(int index) {
    if ((_items[index]['quantity'] as int) > 1) {
      setState(() {
        _items[index]['quantity'] = (_items[index]['quantity'] as int) - 1;
      });
    }
  }

  void _toggleSelect(int index, bool? val) {
    if (val != null) {
      setState(() {
        _items[index]['isSelected'] = val;
      });
    }
  }

  void _removeItem(int index) {
    final title = _items[index]['title'];
    setState(() {
      _items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title dihapus dari keranjang'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Placeholder logic to undo deletion if needed
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        automaticallyImplyLeading: false,
        actions: [
          if (_items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_outlined, color: AppColors.error),
              onPressed: () {
                setState(() {
                  _items.clear();
                });
              },
            ),
        ],
      ),
      body: _items.isEmpty
          ? _buildEmptyState()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      final isSelected = item['isSelected'] as bool;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: AppColors.hairline),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header toko buku
                            Container(
                              color: AppColors.surfaceSoft,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isSelected,
                                    activeColor: AppColors.primary,
                                    onChanged: (val) => _toggleSelect(index, val),
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  const Icon(Icons.storefront, size: 18, color: AppColors.muted),
                                  const SizedBox(width: 8),
                                  Text(
                                    item['storeName'],
                                    style: AppTextStyles.titleSm().copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Item data
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Sampul Buku (dengan fix path assets/)
                                  Container(
                                    width: 70,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceSoft,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      'assets/images/${item['imageIndex']}.jpg',
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.book, color: AppColors.muted),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  
                                  // Detail Buku
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'],
                                          style: AppTextStyles.titleMd(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['author'],
                                          style: AppTextStyles.bodySm(),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          formatRupiah(item['price']),
                                          style: AppTextStyles.titleMd(color: AppColors.primary).copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Jumlah item control
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline, color: AppColors.error, size: 20),
                                        onPressed: () => _removeItem(index),
                                        visualDensity: VisualDensity.compact,
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.surfaceSoft,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove, size: 14),
                                              onPressed: () => _decrementQty(index),
                                              constraints: const BoxConstraints(),
                                              padding: const EdgeInsets.all(8),
                                            ),
                                            Text(
                                              item['quantity'].toString().padLeft(2, '0'),
                                              style: AppTextStyles.titleSm().copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.add, size: 14),
                                              onPressed: () => _incrementQty(index),
                                              constraints: const BoxConstraints(),
                                              padding: const EdgeInsets.all(8),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // Coupon input
                _buildPromoSection(),

                // Summary Checkout Card
                _buildSummaryCard(),
              ],
            ),
    );
  }

  Widget _buildPromoSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.canvas,
        border: Border(
          top: BorderSide(color: AppColors.hairline),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_number_outlined, color: AppColors.accent),
          const SizedBox(width: 12),
          Text(
            'Gunakan Kode Promo GettyBag',
            style: AppTextStyles.titleSm(),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.canvas,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: AppTextStyles.bodySm()),
                Text(formatRupiah(_subtotal), style: AppTextStyles.titleSm()),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ongkos Kirim', style: AppTextStyles.bodySm()),
                Text(formatRupiah(_shippingFee), style: AppTextStyles.titleSm()),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Pembayaran', style: AppTextStyles.titleSm().copyWith(fontWeight: FontWeight.bold)),
                Text(
                  formatRupiah(_total),
                  style: AppTextStyles.displayLg(color: AppColors.primary).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _subtotal > 0
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proses Checkout Berhasil!')),
                      );
                    }
                  : null,
              child: const Text('Checkout Buku'),
            ),
          ],
        ),
      ),
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
                Icons.shopping_cart_outlined,
                size: 36,
                color: AppColors.muted,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Keranjang Kosong',
              style: AppTextStyles.displaySm(),
            ),
            const SizedBox(height: 8),
            Text(
              'Ayo cari buku-buku menarik dari berbagai toko pilihan untuk diisi di keranjang belanjamu!',
              style: AppTextStyles.bodySm(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
