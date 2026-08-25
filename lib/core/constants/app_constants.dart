/// GettyBag — App-wide constants and dummy data
/// All data here is mock/placeholder for UI demonstration.
library;

// ── App Identity ───────────────────────────────────────────────────────────
const String kAppName = 'GettyBag';
const String kAppTagline = 'Your Literary Marketplace';
const String kAppVersion = '1.0.0';

// ── Route Names ────────────────────────────────────────────────────────────
const String kRouteSplash = '/';
const String kRouteLogin = '/login';
const String kRouteHome = '/home';
const String kRouteChat = '/chat';
const String kRouteChatDetail = '/chat/detail';
const String kRouteProfile = '/profile';
const String kRouteCart = '/cart';

// ── Dummy Data: Book Genres ────────────────────────────────────────────────
const List<String> kGenres = [
  'Semua',
  'Novel',
  'Self-Help',
  'Fiksi Ilmiah',
  'Romansa',
  'Petualangan',
  'Bisnis',
  'Komik',
  'Biografi',
];

// ── Dummy Data: Book Stores ────────────────────────────────────────────────
const List<Map<String, dynamic>> kBookStores = [
  {
    'id': '1',
    'name': 'Tere Liye OFC Store',
    'description': 'Toko resmi karya-karya Tere Liye',
    'rating': 4.9,
    'reviewCount': 1240,
    'imageIndex': 1,
    'isVerified': true,
    'location': 'Jakarta',
  },
  {
    'id': '2',
    'name': 'J.S Khairen Fan Store',
    'description': 'Koleksi lengkap J.S Khairen',
    'rating': 4.7,
    'reviewCount': 856,
    'imageIndex': 5,
    'isVerified': true,
    'location': 'Bandung',
  },
  {
    'id': '3',
    'name': 'Gramedia Official',
    'description': 'Toko buku terlengkap Indonesia',
    'rating': 4.8,
    'reviewCount': 5200,
    'imageIndex': 3,
    'isVerified': true,
    'location': 'Jakarta',
  },
];

// ── Dummy Data: Books ──────────────────────────────────────────────────────
const List<Map<String, dynamic>> kBooks = [
  {
    'id': '1',
    'title': 'Bumi',
    'author': 'Tere Liye',
    'genre': 'Fiksi Ilmiah',
    'price': 89000,
    'originalPrice': 120000,
    'discount': 26,
    'rating': 4.9,
    'reviewCount': 2340,
    'storeId': '1',
    'storeName': 'Tere Liye OFC Store',
    'imageIndex': 1,
    'isBestseller': true,
    'isNew': false,
  },
  {
    'id': '2',
    'title': 'Bulan',
    'author': 'Tere Liye',
    'genre': 'Fiksi Ilmiah',
    'price': 79000,
    'originalPrice': 110000,
    'discount': 28,
    'rating': 4.8,
    'reviewCount': 1890,
    'storeId': '1',
    'storeName': 'Tere Liye OFC Store',
    'imageIndex': 2,
    'isBestseller': true,
    'isNew': false,
  },
  {
    'id': '3',
    'title': 'Bintang',
    'author': 'Tere Liye',
    'genre': 'Fiksi Ilmiah',
    'price': 85000,
    'originalPrice': 115000,
    'discount': 26,
    'rating': 4.7,
    'reviewCount': 1560,
    'storeId': '1',
    'storeName': 'Tere Liye OFC Store',
    'imageIndex': 3,
    'isBestseller': false,
    'isNew': false,
  },
  {
    'id': '4',
    'title': 'Matahari',
    'author': 'Tere Liye',
    'genre': 'Fiksi Ilmiah',
    'price': 92000,
    'originalPrice': 125000,
    'discount': 26,
    'rating': 4.9,
    'reviewCount': 2100,
    'storeId': '1',
    'storeName': 'Tere Liye OFC Store',
    'imageIndex': 4,
    'isBestseller': true,
    'isNew': false,
  },
  {
    'id': '5',
    'title': 'Rumah',
    'author': 'J.S Khairen',
    'genre': 'Self-Help',
    'price': 75000,
    'originalPrice': 100000,
    'discount': 25,
    'rating': 4.6,
    'reviewCount': 980,
    'storeId': '2',
    'storeName': 'J.S Khairen Fan Store',
    'imageIndex': 5,
    'isBestseller': false,
    'isNew': true,
  },
  {
    'id': '6',
    'title': 'Bungkam Suara',
    'author': 'J.S Khairen',
    'genre': 'Novel',
    'price': 68000,
    'originalPrice': 90000,
    'discount': 24,
    'rating': 4.5,
    'reviewCount': 740,
    'storeId': '2',
    'storeName': 'J.S Khairen Fan Store',
    'imageIndex': 6,
    'isBestseller': false,
    'isNew': true,
  },
];

// ── Dummy Data: Chat List ──────────────────────────────────────────────────
const List<Map<String, dynamic>> kChatList = [
  {
    'id': '1',
    'storeName': 'Tere Liye OFC Store',
    'lastMessage': 'Pesanan Anda sudah dikemas dan siap dikirim.',
    'time': '12:30',
    'unreadCount': 2,
    'imageIndex': 1,
    'isOnline': true,
  },
  {
    'id': '2',
    'storeName': 'J.S Khairen Fan Store',
    'lastMessage': 'Halo! Ada yang bisa kami bantu? 😊',
    'time': '10:15',
    'unreadCount': 0,
    'imageIndex': 5,
    'isOnline': false,
  },
  {
    'id': '3',
    'storeName': 'Gramedia Official',
    'lastMessage': 'Promo akhir bulan sudah dimulai! Diskon hingga 50%.',
    'time': 'Kemarin',
    'unreadCount': 1,
    'imageIndex': 3,
    'isOnline': true,
  },
];

// ── Dummy Data: Cart Items ────────────────────────────────────────────────
const List<Map<String, dynamic>> kCartItems = [
  {
    'bookId': '1',
    'title': 'Bumi',
    'author': 'Tere Liye',
    'price': 89000,
    'quantity': 1,
    'imageIndex': 1,
    'storeName': 'Tere Liye OFC Store',
    'storeId': '1',
    'isSelected': true,
  },
  {
    'bookId': '4',
    'title': 'Matahari',
    'author': 'Tere Liye',
    'price': 92000,
    'quantity': 2,
    'imageIndex': 4,
    'storeName': 'Tere Liye OFC Store',
    'storeId': '1',
    'isSelected': true,
  },
  {
    'bookId': '5',
    'title': 'Rumah',
    'author': 'J.S Khairen',
    'price': 75000,
    'quantity': 1,
    'imageIndex': 5,
    'storeName': 'J.S Khairen Fan Store',
    'storeId': '2',
    'isSelected': false,
  },
];

// ── Dummy User Data ────────────────────────────────────────────────────────
const Map<String, dynamic> kUser = {
  'name': 'Faiz Faishal Nugroho',
  'email': 'faishal@example.com',
  'phone': '+62 812-3456-7890',
  'address': 'Jl. Sudirman No. 12, Jakarta Pusat',
  'orderCount': 12,
  'wishlistCount': 8,
  'reviewCount': 5,
};

// ── Helper: Format currency ────────────────────────────────────────────────
String formatRupiah(int amount) {
  final str = amount.toString();
  final buffer = StringBuffer();
  int count = 0;
  for (int i = str.length - 1; i >= 0; i--) {
    if (count > 0 && count % 3 == 0) buffer.write('.');
    buffer.write(str[i]);
    count++;
  }
  return 'Rp ${buffer.toString().split('').reversed.join()}';
}
