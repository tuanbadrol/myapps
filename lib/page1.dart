// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:myapps/page2.dart';
import 'package:url_launcher/url_launcher.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('badrol app'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  //color: Colors.blueAccent,
                  // height: 200,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Selamat datang ILD Nismilan 30 & 31 2023',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Center(child: Text('Badrol hisham FBM & UCS')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      _launchWeb('https://uitm.edu.my');
                    },
                    child: Text('WEB UITM')),
                ElevatedButton(
                    onPressed: () {
                      _launchWeb('https://fbm.uitm.edu.my');
                    },
                    child: const Text('WEB FBM')),
                OutlinedButton(
                    onPressed: () {
                      _launchWeb('https://nrucs.uitm.edu.my');
                    },
                    child: const Text('WEB NR'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network('https://picsum.photos/200'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/flutter.jpeg'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PageTwo()));
        },
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }

  Future<void> _launchWeb(String url) async {
    final Uri url2 = Uri.parse(url);
    if (!await launchUrl(
      url2,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
