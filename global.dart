// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/homepage.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:numberpicker/numberpicker.dart';
var appcolor;
var light_theme;
var dark_theme;
var bgcolor_female=Colors.transparent;
var bgcolor_male=Colors.transparent;
var gender= null;
var idweight;
var backcolor=Colors.grey.shade300;
var backcolorlig=Colors.grey.shade200;
double weight=30;
double long2=30;
int height=150;
double result = 22.5;
double ideal_weight = 52;

BoxDecoration lightdecor(colos,bgcolor,double rad,double wid){
  return BoxDecoration(color: bgcolor,
    border: Border.all(
      color: colos,
      width: wid,
    ), //Border.all
    borderRadius: BorderRadius.circular(rad),
    boxShadow: const [
      BoxShadow(
        color: Colors.white70,
        offset: Offset(
          0.0,
          0.0,
        ),
        blurRadius: 5.0,
        spreadRadius: 0.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.white54,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
  );
}
BoxDecoration standard_decor(){
  return BoxDecoration(
    color: backcolorlig,
    border: Border.all(
      color: Colors.white,
      width: 0.2,
    ), //Border.all
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.black38,
        offset: Offset(
          0.0,
          0.0,
        ),
        blurRadius: 5.0,
        spreadRadius: 0.0,
      ), //BoxShadow
      BoxShadow(
        color: Colors.white,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ), //BoxShadow
    ],
  );
}

class gender_selector extends StatefulWidget {
  gender_selector({Key? key}) : super(key: key);

  @override
  State<gender_selector> createState() => gender_selectorState();
}

class gender_selectorState extends State<gender_selector> {
  bool selected = false;
  void ftoggleSelection() {
    setState(() {
      selected = !selected;// Invert the selection state.
      if(selected==true && mselected==true){
        mselected = !mselected;
      }
      if(selected==true){
        gender="female";
      }

    });
  }
  bool mselected = false;
  void mtoggleSelection() {
    setState(() {
      mselected = !mselected; // Invert the selection state.
      if(mselected==true && selected==true){
        selected = !selected;
      }
      if(mselected==true){
        gender="male";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration:  standard_decor(),
        child:  Column(
          children: [
            Text('Select Gender:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: mselected? Colors.blue:Colors.transparent,
                    child: CircleAvatar(
                      radius: 72,
                      backgroundImage: AssetImage('assets/images/male.jpg'),
                    ),
                  ),
                  onTap: (){
                    mtoggleSelection();
                  },
                    onTapCancel: () {
                      setState(() {
                        bgcolor_male = Colors.transparent;
                        gender = "male";
                      });
                    },
                ),//male
                InkWell(
                  child: CircleAvatar(
                    radius: 75,

                    backgroundColor: selected? Colors.blue:Colors.transparent,
                    child: CircleAvatar(
                      radius: 72,
                      backgroundImage: AssetImage('assets/images/female.jpg'),
                    ),
                  ),
                  onTap: (){
                    ftoggleSelection();
                    gender = "female";
                    },
                ),//female
              ],

            ),
          ],
        ),
      );

  }
  weight_selector(){
    return Container(
      decoration:  BoxDecoration(
        color: backcolorlig,
        border: Border.all(
          color: Colors.white,
          width: 0.2,
        ), //Border.all
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(
              0.0,
              0.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        children: [
          Container(height: 40,
            child: Text('Weight', style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
          ),
          AnimatedWeightPicker(
            min: 30,
            max: 200,
            division: 0.2,
            dialThickness: 3,
            dialColor: Colors.blueAccent,
            dialHeight: 60,
            majorIntervalColor: Colors.black,
            selectedValueColor: Colors.blueAccent,
            squeeze: 2.5,
            suffixTextColor: Colors.blueAccent,
            onChange: (newValue) {
               long2 = double.tryParse(newValue)!;
              weight=long2;
            },

          ),
        ],
      ),
    );
  }
  }

Widget heading(leadingtxt,text2,colors1,colors2){
  return Row(
    children: [
      Text(leadingtxt,style: TextStyle(color: colors1,fontSize: 25)),
      SizedBox(width: 1,),
      Text(text2, style: TextStyle(color: colors2,fontSize: 24)),
    ],
  );

}

class height_val extends StatefulWidget {
  const height_val({Key? key}) : super(key: key);

  @override
  State<height_val> createState() => _height_valState();
}

class _height_valState extends State<height_val> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,

      decoration:  standard_decor(),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Text('Height', style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
          ),
          NumberPicker(
            value: height,
            minValue: 0,
            maxValue: 200,
            step: 1,
            itemHeight: 100,
            axis: Axis.horizontal,
            onChanged: (value) =>
                setState(() => height = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() {
                  final newValue = height - 1;
                  height = newValue.clamp(0, 200);
                }),
              ),
              Text('Height: $height cm'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  final newValue = height + 1;
                  height = newValue.clamp(0, 200);
                }),
              ),
            ],
          ),

        ],
      ),
    ) ;
  }
}
double? heightsq;
calculate_btn(context){
  return Transform.scale(
    scale: 1.2,
    child: ElevatedButton(
        onPressed: (){
          if(gender == null){
            var snackbar= SnackBar(content: Text('Please select gender'),duration: Duration(seconds: 2),);
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          else{
            double  heightmeter= height*0.01;
            heightsq= heightmeter*heightmeter;
            result = weight/heightsq!;
            idealweightcal();
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>resultpage()));}

        },
        child: Text("-Calculate-"),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)
                )
            )
        ),

    ),
  );
}
Widget displayresult(){
  return Text(result.toStringAsFixed(2),style: TextStyle(fontSize: 64,fontWeight: FontWeight.w500),);
}
Widget resultlabel(){
  if(result<=18.5){
    return  Text("UnderWeight",
        style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500)
    );
  }else if(18.5<result && result<=24.9){
    return  Text("Healthy",
        style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500)
    );
  }else if(25<=result && result<30){
    return  Text("Overweight",
        style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500)
    );
  }else{
    return  Text("Obesity",
        style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500)
    );
  }
}
Widget idealweight(){
  return Column(
    children: [
      Text("According to your height,",style: TextStyle(fontSize: 18,color: Colors.black38),),
      Text(" your weight should be-$idweight kgs",style: TextStyle(fontSize: 18,color: Colors.black38)),
    ],
  );
}
int idealweightcal(){

  if(height>150){
    double remaing_cm = height-150;
    double remaining_in = remaing_cm/2.5;
    for(int i =1; i<=remaining_in;i++){
      ideal_weight = ideal_weight+1.7;
    }
  }else if(height <= 150){}
  return idweight=ideal_weight.round();
}
void clearval(){
  ideal_weight=52;
}
Widget retry(context){
  return Container(
    height: 60,
    width: 60,
    decoration:  BoxDecoration(
      color: backcolor,
      border: Border.all(
        color: Colors.black12,
        width: 0.2,
      ), //Border.all
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
          offset: Offset(
            0.0,
            0.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 0.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ],
    ),
    child: InkWell(
      onTap: (){
        clearval();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=> homepage()), (route) => false);
      },
      child: Transform.scale(
          scale: 1.5,
          child: Icon(Icons.refresh)),
    ),
  );
}
