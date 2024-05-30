import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SmartDevicesBox extends StatefulWidget {
  final String smartDevicesName;
  final String iconPath;
  final bool initialPowerOn;

  const SmartDevicesBox({
    super.key,
    required this.smartDevicesName,
    required this.iconPath,
    required this.initialPowerOn,
  });

  @override
  _SmartDevicesBoxState createState() => _SmartDevicesBoxState();
}

class _SmartDevicesBoxState extends State<SmartDevicesBox> {
  late bool powerOn;

  @override
  void initState() {
    super.initState();
    powerOn = widget.initialPowerOn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: powerOn ?  Colors.black87 : Color.fromARGB(186, 0, 12, 102),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.iconPath,
            width: 65,
            height: 65,
            color: powerOn ? const  Color.fromARGB(255, 0, 252, 8) : Color.fromARGB(255, 241, 67, 67),
          ),
          Text(
            widget.smartDevicesName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: powerOn ? Colors.greenAccent :const Color.fromARGB(255, 255, 35, 35),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSwitch(
                value: powerOn,
                onChanged: (bool value) {
                  setState(() {
                    powerOn = value;
                  });
                },
                activeColor: Colors.green,
                trackColor: Colors.red,
              ),
              const SizedBox(width: 10), // Space between the switch and the text
              Text(
                powerOn ? 'ON' : 'OFF',
                style:  TextStyle(
                  color: powerOn ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
