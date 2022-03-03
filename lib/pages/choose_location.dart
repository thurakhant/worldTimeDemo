import 'package:flutter/material.dart';
import 'package:world_time_demo/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Dubai', time: '', flag: 'dubai.png', url: 'asia/dubai'),
    WorldTime(
        url: 'Europe/London', location: 'London', flag: 'uk.png', time: ''),
    WorldTime(
        url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', time: ''),
    WorldTime(
        url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', time: ''),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        time: ''),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', time: ''),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        time: ''),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        time: ''),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        time: ''),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
