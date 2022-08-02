import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi/components/custom_card.dart';
import 'package:bmi/screens/resultpage.dart';
import 'package:bmi/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Gender gender_selected = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    gender: "Male",
                    icon: Icons.male,
                    isSelected: gender_selected == Gender.male ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    gender: "Female",
                    icon: Icons.female,
                    isSelected: gender_selected == Gender.female ? true : false,
                    onTap: () {
                      setState(() {
                        gender_selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: 'cm',
              onChanged: (val) {
                setState(
                  () {
                    height = val.toInt();
                    print(height);
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: AWCard(
                    title: 'Age',
                    value: age,
                    onPressedMinus: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: AWCard(
                    title: 'Weight(kg)',
                    value: weight,
                    onPressedMinus: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              title: 'CALCULATE',
              onTap: () {
                print('calculate');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        gender: gender_selected,
                        height: height,
                        age: age,
                        weight: weight,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
