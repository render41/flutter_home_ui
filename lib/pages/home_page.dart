import 'package:flutter/material.dart';
import 'package:flutter_home_ui/utils/smart_devicebox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40.0;
  final double verticalPadding = 25.0;

  List mySmartDevices = [
    ["Smart Light", "lib/icons/light-bulb.png", false],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Menu Icons
                  Image(
                    image: AssetImage('lib/icons/menu.png'),
                    height: 30,
                  ),
                  Icon(
                    Icons.person,
                    size: 35,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Gabriel",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text("Smart Devices"),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: mySmartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
