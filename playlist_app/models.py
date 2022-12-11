"""Models for Playlist app."""

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import UniqueConstraint

db = SQLAlchemy()


class Playlist(db.Model):
    """Playlist."""

    __tablename__ = 'playlists'

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True)
    name = db.Column(
        db.Text,
        nullable=False)
    description = db.Column(
        db.Text,
        nullable=False,
        default="")

    songs = db.relationship(
        'Song', secondary='playlists_songs', backref='playlists')

    def __repr__(self):
        return f"<User {self.name} {self.description} id={self.id}>"


class Song(db.Model):
    """Song."""

    __tablename__ = 'songs'

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True)
    title = db.Column(
        db.Text,
        nullable=False)
    artist = db.Column(
        db.Text,
        nullable=False)
    UniqueConstraint(title, artist)
    # Backreference here did not work.

    def __repr__(self):
        return f"<User {self.title} {self.artist} id={self.id}>"


class PlaylistSong(db.Model):
    """Mapping of a playlist to a song."""

    __tablename__ = "playlists_songs"

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True)
    playlist_id = db.Column(
        db.Integer,
        db.ForeignKey('playlists.id'),
        nullable=False)
    song_id = db.Column(
        db.Integer,
        db.ForeignKey('songs.id'),
        nullable=False)

    def __repr__(self):
        return f"<User {self.playlist_id} {self.song_id} id={self.id}>"


# DO NOT MODIFY THIS FUNCTION
def connect_db(app):
    """Connect to database."""

    app.app_context().push()
    db.app = app
    db.init_app(app)
