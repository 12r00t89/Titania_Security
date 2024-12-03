import 'package:flutter/material.dart';

class Device {
  String name;
  String ip;

  Device({required this.name, required this.ip});
}

class DeviceManagementScreen extends StatefulWidget {
  @override
  _DeviceManagementScreenState createState() => _DeviceManagementScreenState();
}

class _DeviceManagementScreenState extends State<DeviceManagementScreen> {
  final List<Device> _devices = [
    Device(name: "Device 1", ip: "192.168.1.1"),
    Device(name: "Device 2", ip: "192.168.1.2"),
  ];

  void _addOrEditDevice({Device? device}) {
    final TextEditingController nameController =
        TextEditingController(text: device?.name ?? "");
    final TextEditingController ipController =
        TextEditingController(text: device?.ip ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(device == null ? "Add New Device" : "Edit Device"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Device Name"),
            ),
            TextField(
              controller: ipController,
              decoration: InputDecoration(labelText: "IP Address"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final String name = nameController.text;
              final String ip = ipController.text;

              if (name.isNotEmpty && ip.isNotEmpty) {
                setState(() {
                  if (device == null) {
                    _devices.add(Device(name: name, ip: ip));
                  } else {
                    device.name = name;
                    device.ip = ip;
                  }
                });
                Navigator.pop(context);
              }
            },
            child: Text(device == null ? "Add" : "Save"),
          ),
        ],
      ),
    );
  }

  void _deleteDevice(Device device) {
    setState(() {
      _devices.remove(device);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Devices"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (context, index) {
                  final device = _devices[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      title: Text(device.name),
                      subtitle: Text("IP: ${device.ip}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _addOrEditDevice(device: device),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteDevice(device),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addOrEditDevice(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Add New Device",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
