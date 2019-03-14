import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_player/theme.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key key,
    @required this.isPlaying,
  }) : super(key: key);

  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
        shadowColor: Colors.black87,
        color: accentColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
          child: new Column(
            children: <Widget>[
              new RichText(
                text: new TextSpan(text: '', children: [
                  new TextSpan(
                      text: 'Song title\n',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                          height: 1.5)),
                  new TextSpan(
                      text: 'Artist name\n',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          height: 1.5)),
                ]),
              ),
              // the controls
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    new PreviousButton(),
                    Expanded(
                      child: Container(),
                    ),
                    new PlayPauseButton(isPlaying: isPlaying),
                    Expanded(
                      child: Container(),
                    ),
                    new Nextbutton(),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
    @required this.isPlaying,
  }) : super(key: key);

  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    bool isPlaying = true;
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: () {
        isPlaying = false;
      },
      fillColor: Colors.white,
      elevation: 10.0,
      highlightColor: lightAccentColor.withOpacity(0.5),
      splashColor: lightAccentColor,
      highlightElevation: 50.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isPlaying
            ? Icon(Icons.pause, color: darkAccentColor, size: 35.0)
            : Icon(
                Icons.play_arrow,
                color: darkAccentColor,
                size: 35.0,
              ),
      ),
    );
  }
}

class Nextbutton extends StatelessWidget {
  const Nextbutton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Icon(Icons.skip_next, color: Colors.white, size: 36.0),
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Icon(Icons.skip_previous, color: Colors.white, size: 36.0),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: new Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
