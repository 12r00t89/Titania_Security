class BlockchainService {
  Future<String> registerDevice(String deviceName, String deviceIP) async {
    await Future.delayed(Duration(seconds: 2));
    return "Transaction simulated: Registered device $deviceName with IP $deviceIP";
  }

  Future<List<Map<String, String>>> getRegisteredDevices() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      {"name": "Device 1", "ip": "192.168.0.1"},
      {"name": "Device 2", "ip": "192.168.0.2"},
      {"name": "Device 3", "ip": "192.168.0.3"},
    ];
  }
}
