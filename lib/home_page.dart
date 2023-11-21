import 'package:flutter/material.dart';
import 'package:latihan/screens/blog_page.dart';
import 'package:latihan/screens/news_page.dart';
import 'package:latihan/screens/reports_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Responsi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsPage()),
                      );
                    },
                    child: const Content(
                      image: 'assets/images/news.png',
                      title: 'NEWS',
                      text:
                          'Get an overide of the lates SpaceFlight news, from various sources! Easily link your users to the right websites',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BlogPage()),
                      );
                    },
                    child: const Content(
                      image: 'assets/images/blog.png',
                      title: 'BLOG',
                      text:
                          'Blog often provide a more detailed overeview of launches and mission.',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BlogPage()),
                      );
                    },
                    child: const Content(
                      image: 'assets/images/blog.png',
                      title: 'BLOGS',
                      text:
                          'Get an overide of the lates SpaceFlight news, from various sources! Easily link your users to the right websites',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportsPage()),
                      );
                    },
                    child: const Content(
                      image: 'assets/images/reports.png',
                      title: 'REPORTS',
                      text:
                          'Blog often provide a more detailed overeview of launches and mission.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
