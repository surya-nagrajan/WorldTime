import 'package:flutter/material.dart';
import "package:weather/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  /// data fetching


  void setUpWorldTime() async {
    WorldTime instance=WorldTime(location: 'Berlin', flag:'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,"/home",arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      "isDay":instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: SpinKitCubeGrid(
          color: Colors.lightBlue,
          size: 75.0,
        )

      )
    );
  }
}
