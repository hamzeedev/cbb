import 'package:cbb/res/texts/app_text_styles.dart';
import 'package:cbb/view/setting/components/designed_setting_body.dart';
import 'package:flutter/material.dart';

class MagazinePage extends StatelessWidget {
  final List<MagazineArticle> dummyArticles = [
    MagazineArticle(
      title: 'Discover the Beauty of Nature',
      author: 'John Doe',
      imageUrl: 'assets/solvingforhealth.jpeg',
    ),
    MagazineArticle(
      title: 'Research',
      author: 'Jane Smith',
      imageUrl: 'assets/research.png',
    ),

    // Add more dummy articles as needed
  ];

  MagazinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignedSettingBody(
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Magazines",
              style: AppTextStyles.heading1BlackTextStyle,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: dummyArticles.length,
                  itemBuilder: (context, index) {
                    final article = dummyArticles[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                  10.0), // Adjust the radius as needed
                              topRight: Radius.circular(
                                  10.0), // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              article.imageUrl,
                              height: 160.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text('By ${article.author}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MagazineArticle {
  final String title;
  final String author;
  final String imageUrl;

  MagazineArticle({
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}
