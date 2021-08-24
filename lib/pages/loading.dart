import 'package:flutter/material.dart';
import 'package:first_full_app/servises/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   String time='loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location:'Berlin', flag:'', url:'Africa/Monrovia');
    await instance.getTime();
    print('time' + instance.time);
    setState(() {
      time=instance.time;
    });
  }
  @override
  void initState() {
    super.initState();
   setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}
