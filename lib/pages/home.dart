import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.blue[300] : Colors.indigo[900];
    Color? textColor = data['isDaytime'] ? Colors.grey[900] : Colors.grey[200];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.blue[700],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: textColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 70,),
                // ElevatedButton.icon(
                //     onPressed: (){},
                //     icon: Icon(
                //       Icons.edit_location,
                //       color: Colors.blue[100],
                //     ),
                //   label: Text('Choose Location'),
                // ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
