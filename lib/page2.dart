// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('directory'), centerTitle: true),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.people_alt),
                title: const Text('Contact 1 Room'),
                trailing: Wrap(spacing: 10, children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        _sendWhatsapp('0332485036', context);
                      },
                      icon: const FaIcon(FontAwesomeIcons.whatsapp),
                      color: Colors.amber,
                    ),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        _makePhoneCall('0332485036');
                      },
                      icon: const Icon(Icons.call),
                      color: Colors.amber,
                    ),
                  ),
                ]),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.people_alt),
                title: const Text('Contact 2 Office'),
                trailing: CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      _makePhoneCall('03339365611');
                    },
                    icon: const Icon(Icons.call),
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendWhatsapp(String phone, BuildContext context) async {
    var url = Uri.parse("https://api.whatsapp.com/send?phone=6$phone");
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
  }
}
