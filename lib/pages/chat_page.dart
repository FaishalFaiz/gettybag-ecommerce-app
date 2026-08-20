import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Daftar Chat
    final List<Map<String, String>> chats = [
      {
        'name': 'Tere Liye OFC Store',
        'message': 'Segera Memesan Sebelum Kehabisan.',
        'time': '12:30',
        'avatar': 'assets/images/1.jpg',
      },
      {
        'name': 'J.S Khairen Fan Store',
        'message': 'Hallo, Selamat Datang Di Nike Official.',
        'time': '12:05',
        'avatar': 'assets/images/5.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 42, 42, 45),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 42, 42, 45)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Tombol Filter
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 19.0,
              vertical: 8.0,
            ),
            color: Colors.white,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Semua',
                    style: TextStyle(
                      color: Color.fromARGB(255, 42, 42, 45),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Belum Dibaca',
                    style: TextStyle(color: Color.fromRGBO(255, 114, 123, 1)),
                  ),
                ),
              ],
            ),
          ),
          // List Chat
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat['avatar']!),
                    radius: 25,
                  ),
                  title: Text(
                    chat['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat['message']!),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Mencegah bottom overflow
                    children: [
                      Text(
                        chat['time']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      if (index == 0)
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "ChatDetail");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
