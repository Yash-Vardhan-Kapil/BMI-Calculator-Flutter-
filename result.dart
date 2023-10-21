// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'global.dart';

class resultpage extends StatefulWidget {
  const resultpage({Key? key}) : super(key: key);

  @override
  State<resultpage> createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backcolor,
        leading: BackButton(onPressed: () {clearval();
          Navigator.pop(context);},
            color: Colors.black,
        ),title: heading('Your','Summary',Colors.cyan,Colors.grey.shade700),
      ),
      body: Container(
        color: backcolor,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              decoration: lightdecor(Colors.white,backcolorlig, 40, 1.0),
              alignment: Alignment.center,
              width: 350,
              height: 350,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Your BMI is ",
                        style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500)
                    ),
                    SizedBox(height: 12,),
                    displayresult(),
                    SizedBox(height: 7,),
                    Text('kg/m\u00B2', style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500)),
                    SizedBox(height: 45,),
                    SfLinearGauge(
                      minimum: 10,
                      maximum: 40,
                      minorTicksPerInterval: 4,
                      useRangeColorForAxis: true,
                      animateAxis: true,
                      axisTrackStyle: LinearAxisTrackStyle(thickness: 1),
                      ranges: <LinearGaugeRange>[
                        LinearGaugeRange(
                            startValue: 10,
                            endValue: 18.5,
                            position: LinearElementPosition.outside,
                            color: Color(0xffF45656)),
                        LinearGaugeRange(
                            startValue: 18.5,
                            endValue: 24.9,
                            position: LinearElementPosition.outside,
                            color: Color(0xff0DC9AB)),
                        LinearGaugeRange(
                            startValue: 24.9,
                            endValue: 29.9,
                            position: LinearElementPosition.outside,
                            color: Color(0xffFFC93E)),
                        LinearGaugeRange(
                            startValue: 29.9,
                            endValue: 40,
                            position: LinearElementPosition.outside,
                            color: Color(0xffF45656)),
                      ],
                      markerPointers: [LinearShapePointer(
                        value: result,
                        height: 20,
                        elevation: 2,
                      animationType: LinearAnimationType.easeOutBack,
                      )],
                    ),
                    SizedBox(height: 20,),
                    resultlabel(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            idealweight(),
            SizedBox(height: 30,),
            retry(context)

          ],
        ),
      ),

    );
  }
}
