import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SandboxAnalyzerScreen extends StatefulWidget {
  @override
  _SandboxAnalyzerScreenState createState() => _SandboxAnalyzerScreenState();
}

class _SandboxAnalyzerScreenState extends State<SandboxAnalyzerScreen> {
  final TextEditingController _urlController = TextEditingController();
  final List<Map<String, String>> _scanLogs = [];
  bool _isScanning = false;

  final List<String> _scanResults = [
    "Safe - No malicious activity detected.",
    "Legitimate - Verified as a trusted source.",
    "Malicious - Identified as a phishing site.",
    "Malicious - Contains malware or harmful scripts.",
    "Suspicious - URL redirects to unknown sources.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox Analyzer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Titania Sandbox Analyzer",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueAccent),
            ),
            SizedBox(height: 16),
            _buildUrlInput(),
            SizedBox(height: 16),
            _isScanning
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _analyzeUrl,
                    child: Text("Analyze URL"),
                  ),
            SizedBox(height: 16),
            ..._scanLogs.map((log) => _buildScanLogCard(context, log)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUrlInput() {
    return TextField(
      controller: _urlController,
      decoration: InputDecoration(
        labelText: "Enter URL",
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => _urlController.clear(),
        ),
      ),
    );
  }

  void _analyzeUrl() {
    final random = Random();
    final url = _urlController.text.trim();

    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a URL to analyze.")),
      );
      return;
    }

    setState(() {
      _isScanning = true;
    });

    // Simula un análisis con un retraso
    Timer(Duration(seconds: 3), () {
      setState(() {
        final result = _scanResults[random.nextInt(_scanResults.length)];
        _scanLogs.insert(0, {"url": url, "result": result});
        if (_scanLogs.length > 10) {
          _scanLogs.removeLast();
        }
        _isScanning = false;
        _urlController.clear();
      });
    });
  }

  Widget _buildScanLogCard(BuildContext context, Map<String, String> log) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "URL:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              log["url"]!,
              style: TextStyle(color: Colors.grey[800]),
            ),
            SizedBox(height: 12),
            Text(
              "Result:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              log["result"]!,
              style: TextStyle(
                color: log["result"]!.contains("Malicious")
                    ? Colors.red
                    : log["result"]!.contains("Suspicious")
                        ? Colors.orange
                        : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
