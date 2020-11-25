import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data_1 = {};

  void setTime() async {
    WorldTime instance = WorldTime(
        location: 'India',
        url: 'Asia/Kolkata',
        flag: 'Flag-India.jpg',
        isDay: true);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //setTime();
  }

  @override
  Widget build(BuildContext context) {
    data_1 =
        data_1.isEmpty ? ModalRoute.of(context).settings.arguments : data_1;
    //print(data_1);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: data_1['isDay']
                    ? NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnEaaMl1kpzXfY0ZokArbdqRC-nn7AYrpzfQ&usqp=CAU')
                    : NetworkImage(
                        'https://wallpapercave.com/wp/wp4805619.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: SafeArea(
              child: Column(
            //crossAxisAlignment : CrossAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 20.0,),
              FlatButton.icon(
                icon: Icon(
                  Icons.location_on,
                  color: data_1['isDay'] ? Colors.black : Colors.grey[300],
                ),
                //splashColor: Colors.green ,
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                      color: data_1['isDay'] ? Colors.black : Colors.grey[300]),
                ),
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data_1 = {
                      'time': result['time'],
                      'location': result['location'],
                      'url': result['url'],
                      'isDay': result['isDay'],
                      'flag': result['flag']
                    };
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data_1['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color:
                            data_1['isDay'] ? Colors.black : Colors.grey[300]),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data_1['time'],
                style: TextStyle(
                    fontSize: 60.0,
                    color: data_1['isDay'] ? Colors.black : Colors.grey[300]),
              )
            ],
          )),
        ),
      ),
    );
  }
}
