import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.gender,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String gender;
  final onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? cCardPrimaryBGColorSelected : cCardPrimaryBGColor,
            border: Border.all(color: Colors.blue, width: 6),
            borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 80,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.gender,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class AWCard extends StatelessWidget {
  const AWCard({
    Key? key,
    this.title = '',
    this.value = 0,
    required this.onPressedMinus,
    required this.onPressedPlus,
  }) : super(key: key);
  final String title;
  final int value;
  final onPressedMinus;
  final onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 6),
        color: Color(0xff2a2e31),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '${this.value}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonRound(
                text: '-',
                onPressed: this.onPressedMinus,
              ),
              ButtonRound(
                text: '+',
                onPressed: this.onPressedPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRound extends StatelessWidget {
  const ButtonRound({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: RawMaterialButton(
        onPressed: this.onPressed,
        padding: const EdgeInsets.all(1.0),
        shape: CircleBorder(),
        fillColor: Color.fromARGB(255, 6, 134, 238),
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    Key? key,
    required this.onChanged,
    this.title = '',
    this.unit = '',
    this.value = 0,
  }) : super(key: key);
  final onChanged;
  final String title;
  final String unit;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 6),
        color: Color(0xff2a2e31),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${this.value}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                this.unit,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.blue,
              overlayColor: Color.fromARGB(51, 188, 230, 34),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 10.0,
              ),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              value: this.value.toDouble(),
              min: 0.0,
              max: 250.0,
              onChanged: this.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 10,
        color: Colors.blue,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 5,
          bottom: 20,
        ),
        padding: EdgeInsets.only(
          bottom: 5,
        ),
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
