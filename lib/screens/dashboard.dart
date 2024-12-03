import 'package:flutter/material.dart';
import 'device_management.dart';
import 'blockchain_screen.dart';
import 'risk_management.dart';
import 'iot_protection_screen.dart';
import 'edr_screen.dart';
import 'sandbox_analyzer_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: Text(
          'Titania Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Device Management",
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.green, 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), 
                  Row(
                    children: [
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'Manage Devices',
                          Icons.devices,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DeviceManagementScreen()),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'Blockchain',
                          Icons.lock,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BlockchainScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60), 

            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Security Protection",
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.green, 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), 
                  Row(
                    children: [
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'Management Risk',
                          Icons.shield,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RiskManagementScreen()),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'IoT Protection',
                          Icons.wifi_protected_setup,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => IoTProtectionScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60), 

            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Detection and Analysis",
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.green, 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), 
                  Row(
                    children: [
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'EDR Protection',
                          Icons.security,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EDRScreen()),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildFullScreenButton(
                          context,
                          'Sandbox Analyzer',
                          Icons.search,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SandboxAnalyzerScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullScreenButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30),
        backgroundColor: Colors.purple, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
