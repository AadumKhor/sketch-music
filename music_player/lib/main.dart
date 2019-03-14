import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_player/bottom_controls.dart';
import 'theme.dart';
import 'songs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlaying = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          //Seek Bar
          new Expanded(
            child: Center(
                child: Container(
              width: 125.0,
              height: 125.0,
              child: RadialSeekBar(
                child: ClipOval(
                  clipper: CircleClipper(),
                  child: new Image.network(
                    demoPlaylist.songs[0].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
          ),

          // Visualiser
          new Container(
            width: double.infinity,
            height: 125.0,
          ),
          // Song name and controls
          new BottomControls(isPlaying: isPlaying)
        ],
      ),
    );
  }
}

class RadialSeekBar extends StatefulWidget {
  final double trackWidth;
  final Color trackColor;
  final double progress;
  final Color progressColor;
  final double progressPercent;
  final double thumbSize;
  final Color thumbColor;
  final double thumbPosition;
  final Widget child;

  RadialSeekBar(
      {this.trackWidth = 3.0,
      this.trackColor = Colors.grey,
      this.progress = 5.0,
      this.progressColor = darkAccentColor,
      this.progressPercent = 0.0,
      this.thumbSize = 10.0,
      this.thumbColor = darkAccentColor,
      this.thumbPosition = 0.0,
      this.child});

  _RadialSeekBarState createState() => _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: new RadialSeekBarPainter(
        trackWidth: widget.trackWidth,
        trackColor: widget.trackColor,
        progressWidth: widget.progressWidth,
        progressColor: widget.progressColor
      ),
      child: widget.child,
    );
  }
}

class RadialSeekBarPainter extends CustomPainter {
  final double trackWidth;
  final Paint trackPaint;
  final double progress;
  final Paint progressPaint;
  final double progressWidth;
  final double progressPercent;
  final double thumbSize;
  final Paint thumbPaint;
  final double thumbPosition;

  RadialSeekBarPainter({
    @required this.trackWidth,
    @required trackColor = Colors.grey,
    @required this.progress,
    @required this.progressWidth,
    @required progressColor = darkAccentColor,
   @required this.progressPercent,
    @required this.thumbSize,
    @required thumbColor = darkAccentColor,
    @required this.thumbPosition,
  }) :trackPaint = new Paint()
                        ..color =trackColor
                        ..style =PaintingStyle.stroke
                        ..strokeWidth =trackWidth,
      progressPaint = new Paint()
                        ..color =progressColor
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = progressWidth
                        ..strokeCap =StrokeCap.round,
      thumbPaint = new Paint()
                    ..color = thumbColor
                    ..style =PaintingStyle.fill ;

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
