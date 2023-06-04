import 'package:flutter/material.dart';
import 'package:flutter_serialport/flutter_serialport.dart';
import '../widgets/card_list_tile.dart';

class SerialTerminalApp extends StatefulWidget {
  const SerialTerminalApp({super.key});

  @override
  SerialTerminalAppState createState() => SerialTerminalAppState();
}

class SerialTerminalAppState extends State<SerialTerminalApp> {
  List<String> _availablePorts = [];

  @override
  void initState() {
    super.initState();
    _initPorts();
  }

  void _initPorts() =>
    setState(() => _availablePorts = SerialPort.availablePorts);

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Serial Port terminal'),
        ),
        body: Scrollbar(
          child: ListView(
            children: [
              for (final address in _availablePorts)
                Builder(builder: (context) {
                  final port = SerialPort(address);
                  return ExpansionTile(
                    title: Text(address),
                    children: [
                      CardListTile('Description', port.description),
                      CardListTile('Transport', port.transport.toTransport()),
                      CardListTile('USB Bus', port.busNumber?.toPadded()),
                      CardListTile('USB Device', port.deviceNumber?.toPadded()),
                      CardListTile('Vendor ID', port.vendorId?.toHex()),
                      CardListTile('Product ID', port.productId?.toHex()),
                      CardListTile('Manufacturer', port.manufacturer),
                      CardListTile('Product Name', port.productName),
                      CardListTile('Serial Number', port.serialNumber),
                      CardListTile('MAC Address', port.macAddress),
                    ],
                  );
                }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _initPorts,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  
}
