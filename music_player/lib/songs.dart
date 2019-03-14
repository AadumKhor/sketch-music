import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

final demoPlaylist = new DemoPlaylist(
  songs: [
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/434370309/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/avatars-000312484264-af28qp-t200x200.jpg',
      title: 'Perfect Saxophone',
      artist: 'Simon More',
    ),
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/402538329/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/avatars-000344712337-f6po4d-t120x120.jpg',
      title: 'Simply',
      artist: 'Kumbor',
    ),
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/266891990/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/artworks-000165346750-e36z3a-t500x500.jpg',
      title: 'Electro Monotony',
      artist: 'Nights & Weekends',
    ),
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/artworks-000165346750-e36z3a-t500x500.jpg',
      title: 'Debut Trance',
      artist: 'Nights & Weekends',
    ),
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/258735531/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/artworks-000165346750-e36z3a-t500x500.jpg',
      title: 'Debut',
      artist: 'Nights & Weekends',
    ),
    new DemoSong(
      audioUrl:
          'https://api.soundcloud.com/tracks/9540352/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      imageUrl:
          'https://i1.sndcdn.com/avatars-000215855222-tic5d8-t120x120.jpg',
      title: 'Assn1-tribal-beat',
      artist: 'Matt',
    ),
  ],
);

class DemoSong {
  final String audioUrl;
  final String imageUrl;
  final String title;
  final String artist;

  DemoSong(
      {@required this.audioUrl,
      @required this.imageUrl,
      @required this.title,
      @required this.artist});
}

class DemoPlaylist {
  final List<DemoSong> songs;

  DemoPlaylist({
    @required this.songs,
  });
}
