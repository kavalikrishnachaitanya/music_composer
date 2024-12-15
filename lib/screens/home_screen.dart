import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_composer/providers/llm_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final llmProvider = Provider.of<LLMProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Enter a prompt',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final prompt = _promptController.text.trim();
                if (prompt.isNotEmpty) {
                  llmProvider.fetchMusic(prompt);
                }
              },
              child: const Text('Generate Music'),
            ),
            const SizedBox(height: 16),
            llmProvider.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    llmProvider.musicResponse,
                    style: const TextStyle(fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }
}
