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
      backgroundColor: Colors.black, // Fondo negro
      appBar: AppBar(
        title: Text(
          'Titania Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // Fondo del AppBar en negro
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sección de Gestión de Dispositivos
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Device Management",
                    style: TextStyle(
                      fontSize: 28, // Título más grande
                      fontWeight: FontWeight.bold, // Negrita
                      color: Colors.green, // Título en verde
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), // Separación mayor entre el título y los botones
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
            SizedBox(height: 60), // Separación mayor entre secciones

            // Sección de Protección
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Security Protection",
                    style: TextStyle(
                      fontSize: 28, // Título más grande
                      fontWeight: FontWeight.bold, // Negrita
                      color: Colors.green, // Título en verde
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), // Separación mayor entre el título y los botones
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
            SizedBox(height: 60), // Separación mayor entre secciones

            // Sección de Detección y Respuesta
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Detection and Analysis",
                    style: TextStyle(
                      fontSize: 28, // Título más grande
                      fontWeight: FontWeight.bold, // Negrita
                      color: Colors.green, // Título en verde
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), // Separación mayor entre el título y los botones
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
        color: Colors.white, // Ícono en blanco
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Texto en blanco
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30), // Aumenta el tamaño vertical del botón
        backgroundColor: Colors.purple, // Botón en morado
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
