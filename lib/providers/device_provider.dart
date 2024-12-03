import 'package:flutter/material.dart';
import '../models/device.dart';
import 'dart:math';

class DeviceProvider with ChangeNotifier {
  final List<Device> _devices = [];

  List<Device> get devices => _devices;

  DeviceProvider() {
    // Cargar datos simulados al iniciar
    _loadSimulatedData();
  }

  void _loadSimulatedData() {
    final random = Random();
    for (int i = 1; i <= 20; i++) {
      _devices.add(
        Device(
          name: 'Device $i',
          ip: '192.168.${random.nextInt(256)}.${random.nextInt(256)}',
        ),
      );
    }
    notifyListeners();
  }

  void addDevice(Device device) {
    _devices.add(device);
    notifyListeners();
  }

  void deleteDevice(int index) {
    _devices.removeAt(index);
    notifyListeners();
  }
}
