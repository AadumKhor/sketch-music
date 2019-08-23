import 'package:flutter/material.dart';
import 'dart:ui';

// Sketching app for Flutter!
/* this application is used to draw on screen and 
can be ussed in notes like apps. Will addd this feature to them */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Offset> points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    final Container sketchArea = new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(4.0),
      alignment: Alignment.topLeft,
      color: Colors.yellow[100],
      child: CustomPaint(
        painter: Sketcher(points),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: new Text('Sketch Krlo Friends'),
      ),
      // we use the gesture detector to detect if the
      // user has moved his finger on screen.
      body: GestureDetector(
        // this method is used to check the above
        // requirements.
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox box = context.findRenderObject();
            Offset point = box.globalToLocal(details.globalPosition);
            point = point.translate(0.0, -(AppBar().preferredSize.height));

            points = List.from(points)..add(point);
          });
        },
        onPanEnd: (DragEndDetails details){
          points.add(null);
        },
        child: sketchArea,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.refresh),
        tooltip: 'Clear Screen',
        onPressed: (){
          setState(() {
           points.clear() ;
          });
        },
      ),
    );
  }
}

class Sketcher extends CustomPainter {
  //list of points which are to be painted
  final List<Offset> points;
  //constructor of this class
  Sketcher(this.points);
  //boolean is used to determine to paint or not
  //depending on the points in picture. If new points
  // are present only then we'll  repaint
  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return oldDelegate.points != points;
  }

  //the paint function actually used to draw
  void paint(Canvas canvas, Size size) {
    //properties of the paint used to draw
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    // iterate through all the points
    // check if the initial and final points
    // are not null. If not null then draw using
    // canvas function.

    for (var i = 0; i < points.length; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
}
