import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty ? data : ModalRoute.of(context)?.settings?.arguments as Map;

    String bg=data["isDay"] ? "day.jpeg" : "night.jpeg";

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
               image:AssetImage('images/$bg'),
              fit:BoxFit.cover,
            )
          ),
          child: SafeArea(
              child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
      child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async {
                dynamic result= await Navigator.pushNamed(context, "/location");
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'flag':result['flag'],
                    'isDay':result['isDay']
                  };
                });
              },
              child: const Text("Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  )),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data["location"].toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      fontWeight:FontWeight.w900
                    ))
              ],
            ),
            SizedBox(height:30),
            Text(
                data["time"],
              style:TextStyle(
                color:Colors.white,
                fontSize:40
              )
            )
          ],
      ),
    )),
        ));
  }
}
