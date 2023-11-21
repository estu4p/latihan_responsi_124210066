import 'package:flutter/material.dart';
import 'package:latihan/model/list_model.dart';
import 'package:latihan/providers/api_resource.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports LIST'),
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
          future: ApiResource.instance.getReports(),
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
                  var reports = listModel.results![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportsDetail(
                                    rpt: reports,
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
                              "${reports.imageUrl}",
                              width: 100,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "${reports.title}",
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

class ReportsDetail extends StatelessWidget {
  const ReportsDetail({super.key, required this.rpt});

  final Results rpt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REPORTS DETAIL'),
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
              "${rpt.imageUrl}",
            ),
            const SizedBox(height: 8),
            Text(
              "${rpt.title}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${rpt.summary}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          _launchUrl("${rpt.url}");
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
