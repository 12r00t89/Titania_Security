import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class BlockchainScreen extends StatefulWidget {
  @override
  _BlockchainScreenState createState() => _BlockchainScreenState();
}

class _BlockchainScreenState extends State<BlockchainScreen> {
  final List<Map<String, String>> _protectionLogs = [];
  late Timer _timer;

  final List<String> _threats = [
    "Malware Injection - Unwanted code attempting to alter device functions.",
    "Phishing Attempt - Malicious actor trying to steal credentials.",
    "Ransomware Detected - Files encrypted by a hostile actor.",
    "DDoS Attack - High traffic to disrupt device communication.",
    "Man-in-the-Middle - Intercepting communications between devices."
  ];

  final List<String> _vulnerabilities = [
    "Open Port Exploit - Port 8080 left unsecured.",
    "Weak Password - Default password not updated.",
    "Outdated Firmware - Security patches missing.",
    "Unencrypted Data Transfer - Sensitive data sent in plain text.",
    "Unverified API Access - External services accessing device data."
  ];

  @override
  void initState() {
    super.initState();
    _simulateProtection();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _simulateProtection() {
    const actions = [
      "Registering device in blockchain...",
      "Validating device integrity...",
      "Threat detected!",
      "Threat neutralized. Device is safe.",
    ];

    int index = 0;
    final random = Random();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (index == 2) {
          
          final threat = _threats[random.nextInt(_threats.length)];
          final vulnerability = _vulnerabilities[random.nextInt(_vulnerabilities.length)];
          _protectionLogs.add({
            "message": "Threat detected!",
            "details": threat,
            "vulnerability": vulnerability,
          });
        } else {
          
          _protectionLogs.add({
            "message": actions[index],
          });
        }

        
        if (_protectionLogs.length > 10) {
          _protectionLogs.removeAt(0);
        }
        index = (index + 1) % actions.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blockchain Simulation"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Titania Blockchain Protection",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueAccent),
            ),
            SizedBox(height: 16),
            ..._protectionLogs.map((log) => _buildLogCard(context, log)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogCard(BuildContext context, Map<String, String> log) {
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
              log["message"]!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: log["message"] == "Threat detected!" ? Colors.red : Colors.black,
              ),
            ),
            if (log.containsKey("details")) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Threat: ${log["details"]}",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.bug_report, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Vulnerability: ${log["vulnerability"]}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
