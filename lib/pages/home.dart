import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =data.isEmpty ? ModalRoute.of(context).settings.arguments:data;
    print(data);
    // set background
    String bgPath = data['isDayTime'] ? 'assets/daytime.png' : 'assets/nighttime.png';
    Color bgColor=data['isDayTime']? Colors.lightBlue[200]:Colors.blueGrey[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              
              image: AssetImage(bgPath),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Column(
              children: <Widget>[
               FlatButton.icon(
                  onPressed: ()async {
                   dynamic result =await Navigator.pushNamed(context, '/changelocation');
                   setState(() {
                     data={
                       'location':result['location'],
                       'time':result['time'],
                       'isDayTime':result['isDayTime'],
                       'flag':result['flag'],
                     };
                   });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                    ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        fontFamily: 'IndieFlower',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
