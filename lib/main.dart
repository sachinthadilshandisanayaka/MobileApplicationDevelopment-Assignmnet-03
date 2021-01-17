import 'dart:html';
import 'dart:ui';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Battery b = Battery();
  int showBatteryLevel = 0;
  BatteryState state;
  bool broadcastBattery;

  Color COLOR_RED = Colors.red;
  Color COLOR_GREEN = Colors.greenAccent;
  Color COLOR_GRAY = Colors.grey;

  @override
  void initState() {
    super.initState();
    _broadcastBatteryLevel();
    b.onBatteryStateChanged.listen((event) {
      setState(() {
        state = event;
      });
    });
  }

  _broadcastBatteryLevel() async {
    broadcastBattery = true;
    while (broadcastBattery) {
      var bLevel = await b.batteryLevel;
      setState(() {
        this.showBatteryLevel = bLevel;
      });
      await Future.delayed(Duration(seconds: 5));
    }
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      broadcastBattery = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Battery Level"),
          centerTitle: true,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          spreadRadius: -5,
                          offset: Offset(4, 4),
                          color: COLOR_GRAY,
                        )
                      ]),
                  child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          startAngle: 270,
                          endAngle: 270,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 1,
                            color: showBatteryLevel <= 10
                                ? COLOR_RED
                                : COLOR_GREEN,
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: double.parse(showBatteryLevel.toString()),
                              width: 0.3,
                              color: Colors.white,
                              pointerOffset: 0.1,
                              cornerStyle: showBatteryLevel == 100
                                  ? CornerStyle.bothFlat
                                  : CornerStyle.endCurve,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              positionFactor: 0.5,
                              angle: 90,
                              widget: Text(
                                showBatteryLevel == null
                                    ? 0
                                    : showBatteryLevel.toString() + " %",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
