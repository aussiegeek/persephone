//
//  SongItem.swift
//  Persephone
//
//  Created by Daniel Barber on 2019/3/25.
//  Copyright © 2019 Dan Barber. All rights reserved.
//

struct Song {
  var mpdSong: MPDClient.MPDSong

  var disc: String {
    return mpdSong.getTag(.disc)
  }

  var trackNumber: String {
    return mpdSong.getTag(.track)
  }

  var title: String {
    return mpdSong.getTag(.title)
  }

  var artist: String {
    return mpdSong.getTag(.artist)
  }

  var albumArtist: String {
    return mpdSong.getTag(.albumArtist)
  }

  var duration: Time {
    return Time(timeInSeconds: mpdSong.duration)
  }

  var album: Album {
    return Album(mpdAlbum: mpdSong.album)
  }
}

extension Song: Equatable {
  static func == (lhs: Song, rhs: Song) -> Bool {
    return (lhs.title == rhs.title) &&
      (lhs.artist == rhs.artist) &&
      (lhs.album == rhs.album)
  }
}

extension Song: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(mpdSong.uriString)
    hasher.combine(disc)
    hasher.combine(trackNumber)
    hasher.combine(title)
    hasher.combine(artist)
    hasher.combine(album.title)
  }
}
