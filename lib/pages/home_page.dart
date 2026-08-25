import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';
import '../widgets/HomeAppBar.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/ItemsWidget.dart';
import 'account_page.dart';
import 'cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePageContent(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart_rounded),
            label: 'Keranjang',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String _selectedGenre = 'Semua';
  final Set<String> _wishlist = {};
  final List<Map<String, dynamic>> _cartItemsList = [];

  void _toggleWishlist(String bookId) {
    setState(() {
      if (_wishlist.contains(bookId)) {
        _wishlist.remove(bookId);
      } else {
        _wishlist.add(bookId);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _wishlist.contains(bookId)
              ? 'Buku ditambahkan ke Wishlist'
              : 'Buku dihapus dari Wishlist',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _addToCart(Map<String, dynamic> book) {
    setState(() {
      _cartItemsList.add(book);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book['title']} berhasil ditambahkan ke keranjang'),
        action: SnackBarAction(
          label: 'Lihat',
          textColor: AppColors.accent,
          onPressed: () {
            // Navigator to cart
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter books based on selected genre
    final filteredBooks = _selectedGenre == 'Semua'
        ? kBooks
        : kBooks.where((book) => book['genre'] == _selectedGenre).toList();

    return Scaffold(
      appBar: HomeAppBar(
        unreadChats: 3,
        onChatTap: () {
          Navigator.pushNamed(context, kRouteChat);
        },
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Search Bar Pill style Airbnb
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.canvas,
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(color: AppColors.hairline),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search_rounded, color: AppColors.muted),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Cari buku, penulis, penerbit...',
                        hintStyle: AppTextStyles.bodySm(color: AppColors.muted),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: IconButton(
                        icon: const Icon(Icons.tune_rounded, color: Colors.white, size: 20),
                        onPressed: () {
                          // Filter bottom sheet
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Horizontal Store Promos / Banner
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: kBookStores.length,
              itemBuilder: (context, index) {
                final store = kBookStores[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Toko Pilihan',
                                  style: AppTextStyles.uppercaseTag(color: AppColors.accent).copyWith(fontSize: 9),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                store['name'],
                                style: AppTextStyles.titleMd(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                store['description'],
                                style: AppTextStyles.captionSm(color: Colors.white70),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/${store['imageIndex']}.jpg',
                            width: 60,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Categories Header & Filter chip list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pilih Genre',
              style: AppTextStyles.displaySm(),
            ),
          ),
          const SizedBox(height: 12),
          CategoriesWidget(
            genres: kGenres,
            selectedGenre: _selectedGenre,
            onGenreSelected: (genre) {
              setState(() {
                _selectedGenre = genre;
              });
            },
          ),
          const SizedBox(height: 24),

          // Best Selling Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Katalog Buku Pilihan',
                  style: AppTextStyles.displaySm(),
                ),
                Text(
                  '${filteredBooks.length} Buku',
                  style: AppTextStyles.caption(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Book Katalog Grid
          ItemsWidget(
            books: filteredBooks,
            wishlist: _wishlist,
            onWishlistToggle: _toggleWishlist,
            onAddToCart: _addToCart,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
