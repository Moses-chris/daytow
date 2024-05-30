import 'package:flutter/material.dart';
import 'package:myapp/widgets/smart_devices_box.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List mySmartDevices = [
    ["smart_light","lib/icons/light-bulb.png",true],
    ["smart_AC","lib/icons/air-conditioner.png",false],
    ["smart_TV","lib/icons/smart-tv.png",false],
    ["smart_Fan","lib/icons/fan.png",false]
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color(0xff050a30),
      body:  SafeArea(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              color:const Color(0xFF000c66),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/icons/menu.png',
                      height: 30,
                      width: 30,
                      color: Color(0xFF7ec8e3)
                    ),
                    const Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF7ec8e3)),
                    ]
                ),
              ),
            ),
            Container(
              width: double.infinity,                 
              decoration: const BoxDecoration(
                color: Color(0xFF000c66),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              padding:const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'welcome home',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7ec8e3)
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Chris Moses',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7ec8e3)
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('Smart Home Devices',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF7ec8e3),
                fontWeight: FontWeight.bold,)
                  ),
              ),
             const SizedBox(height: 10),
             Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9,
                  ),
                   itemBuilder: (context, index){
                    return SmartDevicesBox(
                      smartDevicesName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      initialPowerOn: mySmartDevices[index][2],

                    );
                  },
               )
              ),
          ],
        ),
      ), 
    );
  }
}