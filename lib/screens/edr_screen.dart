import 'package:flutter/material.dart';

class EDRScreen extends StatelessWidget {
  final List<Map<String, dynamic>> edrScenarios = [
    {
      "situation": "An attacker attempts to install malware to steal credentials and move laterally.",
      "protection": 
          "Continuous monitoring detects the suspicious file via behavioral analysis, blocking its execution and isolating the endpoint from the network.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "A user clicks a malicious link that downloads ransomware, encrypting critical files.",
      "protection": 
          "Proactive prevention detects abnormal encryption activity and halts the process. Files are restored using backup and rollback capabilities.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "An employee inputs credentials into a phishing page sent by an attacker.",
      "protection": 
          "EDR detects that the browser is attempting to connect to a malicious domain and blocks the connection, alerting the admin.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "An attacker uses compromised credentials to propagate laterally in the network.",
      "protection": 
          "Behavioral analysis detects abnormal use of administrative tools. Suspicious traffic is blocked, and compromised credentials are disabled.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Admin needs to investigate an attack detected on a server.",
      "protection": 
          "Titania EDR provides detailed logs of all activities on the endpoint, enabling forensic analysis to identify the attack vector.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Anomalous behavior detected across multiple endpoints, suggesting a coordinated attack.",
      "protection": 
          "Titania EDR isolates affected endpoints, generates alerts, and applies network-wide policies to neutralize the threat.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "An endpoint has outdated software with a known vulnerability.",
      "protection": 
          "Regular scans identify the vulnerability and alert the admin to update the software, reducing the risk of exploitation.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "An employee connects an infected USB device to their computer.",
      "protection": 
          "EDR detects malicious executable files on the USB, blocks their execution, and issues an alert. The endpoint is monitored for further attempts.",
      "status": "Resolved by Titania IoT Protection"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDR (Endpoint Detection and Response)"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Titania EDR Protection Scenarios",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueAccent),
            ),
            SizedBox(height: 16),
            ...edrScenarios.map((scenario) => _buildScenarioCard(context, scenario)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildScenarioCard(BuildContext context, Map<String, dynamic> scenario) {
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
              "Situation:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              scenario["situation"],
              style: TextStyle(color: Colors.grey[800]),
            ),
            SizedBox(height: 12),
            Text(
              "Protection:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              scenario["protection"],
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Text(
                  scenario["status"],
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
