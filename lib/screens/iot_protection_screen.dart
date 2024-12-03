import 'package:flutter/material.dart';

class IoTProtectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> protectionScenarios = [
    {
      "situation": "Sensors transmitting temperature data via Wi-Fi.",
      "protection":
          "TLS encryption ensures that the data is protected during transmission. Any interception results in encrypted, unusable data.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Only administrators should access the sensor control panel.",
      "protection":
          "Multi-factor authentication (MFA) and digital certificates ensure secure access to the system.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Attacker attempts to send false commands to sensors to alter temperature thresholds.",
      "protection":
          "Machine learning detects anomalies and blocks the command, alerting the administrator.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Attacker compromises a sensor due to a weak password.",
      "protection":
          "Network segmentation prevents access to central servers or other sensors. IoT firewall blocks unauthorized communications.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Firmware update released to fix vulnerabilities.",
      "protection":
          "Digital signatures verify the authenticity of updates before installation, ensuring only approved versions are installed.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "Intruder attempts to manipulate a sensor physically.",
      "protection":
          "Anti-tampering mechanisms detect physical manipulations, send alerts, and disconnect the sensor from the system.",
      "status": "Resolved by Titania IoT Protection"
    },
    {
      "situation": "System detects a DDoS attack on the sensor network.",
      "protection":
          "Automated mitigation mechanisms limit traffic from suspicious sources and generate detailed incident reports.",
      "status": "Resolved by Titania IoT Protection"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IoT Protection"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Titania IoT Protection Scenarios",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueAccent),
            ),
            SizedBox(height: 16),
            ...protectionScenarios.map((scenario) => _buildScenarioCard(context, scenario)).toList(),
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
