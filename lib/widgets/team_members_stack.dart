import 'package:flutter/material.dart';

class TeamMembers extends StatelessWidget {
  int progressValue;
  TeamMembers(this.progressValue);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 110,
          child: Stack(
            children: [
              Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.5,
                  ),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      offset: const Offset(3.0, 0.0),
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Image.asset('assets/man.png'),
              ),
              Positioned(
                left: 33,
                child: Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        offset: const Offset(3.0, 0.0),
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/man.png',
                  ),
                ),
              ),
              Positioned(
                left: 63,
                child: Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    color: Colors.grey[800],
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        //offset: const Offset(3.0, 0.0),
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/man.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            right: 5,
          ),
          height: 40,
          width: 45,
          child: Stack(
            children: [
              Positioned(
                left: 7,
                top: 11,
                child: Text(
                  '$progressValue%',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red[50],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  value: 0.85,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}