import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setTime() async{
    WorldTime instance=WorldTime(location: 'India',url: 'Asia/Kolkata',flag: 'Flag-India.jpg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDay':instance.isDay,
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(),
      body:Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
