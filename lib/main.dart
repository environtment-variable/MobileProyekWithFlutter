import 'package:flutter/material.dart';

import 'api_service.dart';
import 'article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita',
      debugShowCheckedModeBanner: false,
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>> _articlesFuture;
  final ApiService _apiService = ApiService();

  // ScrollController untuk memantau posisi scroll & tombol kembali ke atas
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _apiService.fetchArticles();

    // Listener untuk mendeteksi posisi scroll
    _scrollController.addListener(() {
      if (_scrollController.offset >= 300) {
        if (!_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = true;
          });
        }
      } else {
        if (_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Fungsi untuk Pull-to-Refresh
  Future<void> _refreshArticles() async {
    setState(() {
      _articlesFuture = _apiService.fetchArticles();
    });
    await _articlesFuture;
  }

  // Fungsi untuk scroll kembali ke atas secara halus
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Aplikasi Berita'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshArticles,
        child: FutureBuilder<List<Article>>(
          future: _articlesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(child: Text('Error : ${snapshot.error}')),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              final articles = snapshot.data!;

              if (articles.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: const Center(child: Text('Tidak ada berita')),
                    ),
                  ],
                );
              }

              return ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading:
                          article.urlToImage != null &&
                              article.urlToImage!.isNotEmpty
                          ? Image.network(
                              article.urlToImage!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            )
                          : const Icon(Icons.image, size: 50),
                      title: Text(article.title),
                      subtitle: Text(
                        article.description ?? 'Tidak ada deskripsi',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              );
            } else {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(child: Text('Tidak ada berita')),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.lightBlue,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
