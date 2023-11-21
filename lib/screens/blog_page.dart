import 'package:flutter/material.dart';
import 'package:latihan/model/list_model.dart';
import 'package:latihan/providers/api_resource.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog LIST'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: ApiResource.instance.getBlog(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Terjadi Kesalahan");
            }
            if (snapshot.hasData) {
              ListModel listModel = ListModel.fromJson(snapshot.data!);
              return ListView.builder(
                itemCount: listModel.results!.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  var blog = listModel.results![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlogDetail(
                                    blg: blog,
                                  )),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "${blog.imageUrl}",
                              width: 100,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "${blog.title}",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key, required this.blg});

  final Results blg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOG DETAIL'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Image.network(
              "${blg.imageUrl}",
            ),
            const SizedBox(height: 8),
            Text(
              "${blg.title}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${blg.summary}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          _launchUrl("${blg.url}");
        },
        child: Container(
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: .2,
                  blurRadius: 7,
                  offset: Offset(3, 3))
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.manage_search_outlined, size: 35),
              Text(
                'See More...',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      await launchUrl(_uri);
    } else {
      throw Exception('Gagal membuka url : $_uri');
    }
  }
}
