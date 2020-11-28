import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {


  List<WorldTime> locations=[
    WorldTime(location:'India',url:'/Asia/Kolkata',flag:'Flag-India.jpg'),
    WorldTime(location:'Egypt',url:'/Africa/Cairo',flag:'egypt.png'),
    WorldTime(location:'USA',url:'/America/Vancouver',flag:'usa.png'),
    WorldTime(location:'Paris',url:'/Europe/Paris',flag:'paris.png'),
    WorldTime(location:'Greece',url:'/Europe/Athens',flag:'greece.png'),
    WorldTime(location:'Indonesia',url:'/Asia/Jakarta',flag:'indonesia.png'),
    WorldTime(location:'Kenya',url:'/Africa/Nairobi',flag:'kenya.png'),
    WorldTime(location:'South Korea',url:'/Asia/Seoul',flag:'south_korea.png'),
    WorldTime(location:'UK',url:'/Europe/Berlin',flag:'uk.png'),
  ];

  void updateTime(index) async{
    WorldTime variable=locations[index];
    await variable.getTime(variable.url);
    Navigator.pop(context, {
      'time':variable.time,
      'location':variable.location,
      'url':variable.url,
      'flag':variable.flag,
      'isDay':variable.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top:1.0,bottom:1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
