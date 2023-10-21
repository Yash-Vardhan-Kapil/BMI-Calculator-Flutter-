// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'global.dart';
var gs =gender_selectorState();
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: backcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:backcolor ,
        title: heading('BMI','Calculator',Colors.cyan,Colors.grey.shade700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              gender_selector(),
              gs.weight_selector(),
              const height_val(),
              SizedBox(height: 10,),
              calculate_btn(context)

            ],
          ),
        ),
      ),
    );
  }
}
