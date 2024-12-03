import 'package:flutter/material.dart';

class RiskManagementScreen extends StatelessWidget {
  final Map<String, dynamic> deviceInfo = {
    "name": "Device 1",
    "ip": "192.168.0.1",
    "hardware": "Intel i7, 16GB RAM, 512GB SSD",
    "titaniaCompatibility": "100%",
    "policies": [
      "Real-time threat monitoring",
      "Encrypted communication protocols",
      "Zero-day exploit detection",
      "Automatic quarantine for suspicious files"
    ],
    "riskPercentage": 12, // Porcentaje de riesgo
    "vulnerabilities": {
      "blocked": 5,
      "quarantined": 3,
    },
    "emailStats": {
      "secureEmails": 1234,
      "blockedEmails": 56,
      "infectionAttempts": 12,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Management Risk"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Información del dispositivo
            _buildSectionTitle(context, "Device Information"),
            _buildCard([
              _buildInfoRow("Name:", deviceInfo["name"]),
              _buildInfoRow("IP Address:", deviceInfo["ip"]),
              _buildInfoRow("Hardware:", deviceInfo["hardware"]),
              _buildInfoRow("Titania Compatibility:", deviceInfo["titaniaCompatibility"]),
            ]),

            SizedBox(height: 16),

            // Políticas de seguridad
            _buildSectionTitle(context, "Security Policies"),
            _buildCard(deviceInfo["policies"]
                .map<Widget>((policy) => ListTile(
                      leading: Icon(Icons.policy, color: Colors.blue),
                      title: Text(policy),
                    ))
                .toList()),

            SizedBox(height: 16),

            // Porcentaje de riesgo
            _buildSectionTitle(context, "Risk Analysis"),
            _buildCard([
              _buildInfoRow("Risk Percentage:", "${deviceInfo["riskPercentage"]}%"),
              _buildInfoRow("Blocked Vulnerabilities:", "${deviceInfo["vulnerabilities"]["blocked"]}"),
              _buildInfoRow("Quarantined Vulnerabilities:", "${deviceInfo["vulnerabilities"]["quarantined"]}"),
            ]),

            SizedBox(height: 16),

            // Estadísticas de correo
            _buildSectionTitle(context, "Email Security Statistics"),
            _buildCard([
              _buildInfoRow("Secure Emails:", "${deviceInfo["emailStats"]["secureEmails"]}"),
              _buildInfoRow("Blocked Emails:", "${deviceInfo["emailStats"]["blockedEmails"]}"),
              _buildInfoRow("Infection Attempts:", "${deviceInfo["emailStats"]["infectionAttempts"]}"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.blueAccent),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
