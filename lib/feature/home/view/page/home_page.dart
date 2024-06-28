import 'package:covalence/core/asset_path/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../video_call/view/page/video_call_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _joinCall() {
    final roomId = _controller.text.trim();
    if (roomId.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallPage(roomId: roomId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(flex: 1),
            const SizedBox(height: 20),
            Image.asset(AppAsset.callVector),
            const SizedBox(height: 20),
            ShadInputFormField(
              controller: _controller,
              id: 'username',
              label: const Text('Chat Room ID'),
              placeholder: const Text('Enter your chat room id'),
              description: const Text('Lorem Ipsum is simply dummy text.'),
            ),
            const SizedBox(height: 20),
            ShadButton(
              width: double.infinity,
              height: 50,
              text: const Text('Join Call'),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _joinCall();
              },
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
