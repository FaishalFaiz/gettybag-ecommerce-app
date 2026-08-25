import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';

class ItemsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> books;
  final Set<String> wishlist;
  final Function(String) onWishlistToggle;
  final Function(Map<String, dynamic>) onAddToCart;

  const ItemsWidget({
    super.key,
    required this.books,
    required this.wishlist,
    required this.onWishlistToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        final id = book['id'].toString();
        final isFav = wishlist.contains(id);

        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.hairline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo Plate & Badges
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: AppColors.surfaceSoft,
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Hero(
                            tag: 'book_cover_${book['id']}',
                            child: Image.asset(
                              'assets/images/${book['imageIndex']}.jpg',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.book, size: 50, color: AppColors.muted);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Discount Badge
                    if (book['discount'] > 0)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '-${book['discount']}%',
                            style: AppTextStyles.badge(color: AppColors.ink),
                          ),
                        ),
                      ),
                    // Favorite/Heart button
                    Positioned(
                      top: 4,
                      right: 4,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : AppColors.muted,
                            size: 20,
                          ),
                          onPressed: () => onWishlistToggle(id),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Meta block
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store / Publisher Tag
                    Row(
                      children: [
                        const Icon(Icons.storefront_outlined, size: 12, color: AppColors.muted),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            book['storeName'],
                            style: AppTextStyles.captionSm(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Book Title
                    Text(
                      book['title'],
                      style: AppTextStyles.titleMd(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Author
                    Text(
                      book['author'],
                      style: AppTextStyles.bodySm(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Rating & Review Count
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: book['rating'].toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.starRating,
                          ),
                          itemCount: 5,
                          itemSize: 12.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${book['rating']})',
                          style: AppTextStyles.microLabel(color: AppColors.muted),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Price and Add to Cart Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (book['originalPrice'] != null)
                              Text(
                                formatRupiah(book['originalPrice']),
                                style: AppTextStyles.captionSm().copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Text(
                              formatRupiah(book['price']),
                              style: AppTextStyles.titleMd(color: AppColors.primary).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.add_shopping_cart, size: 18),
                          onPressed: () => onAddToCart(book),
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
    );
  }
}
