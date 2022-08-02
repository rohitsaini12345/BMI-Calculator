import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/custom_card.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.age,
    required this.weight,
  }) : super(key: key);

  final Gender gender;
  final int height;
  final int age;
  final int weight;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0.0;
  String result = '';
  String gender = '';
  String img = '';

  void calculate() {
    setState(() {
      gender = this.widget.gender == Gender.male ? 'male' : 'female';

      bmi = (this.widget.weight /
          ((this.widget.height / 100) * (this.widget.height / 100)));
      if (bmi < 18.5) {
        result = 'Underweight';
      } else if (bmi < 25) {
        result = 'Normal';
      } else if (bmi < 30) {
        result = 'Overweight';
      } else if (bmi < 35) {
        result = 'Obese';
      } else {
        result = 'ExtremelyObese';
      }

      img = 'images/${gender}_${result}.png';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 6),
              color: Color(0xff2a2e31),
            ),
            height: 70,
            width: 450,
            margin: EdgeInsets.all(15),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Result',
                style: TextStyle(
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CircleAvatar(
            radius: 140,
            child: Image.asset(this.img),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Score: ',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    '${this.bmi.ceilToDouble()}',
                    style: TextStyle(fontSize: 35, color: Colors.yellow),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              this.result,
              style: TextStyle(fontSize: 40, color: Colors.yellow),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: 480,
                color: Color(0xff2a2e31),
                child: Text(
                  "RECALCULATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
