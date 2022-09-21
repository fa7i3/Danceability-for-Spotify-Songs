SELECT * FROM spotify_song_info

SELECT * FROM spotify_song_info

SELECT a.id, a.name, a.artists, a.release_date, a.year, a.duration_ms,
b.acousticness, b.danceability, b.energy, b.explicit, b.instrumentalness, 
b.key, b.liveness, b.loudness, b.mode, b.popularity, b.speechiness, b.tempo, b.valence
INTO merged_spotify_songs
FROM spotify_song_info as a
JOIN spotify_song_features as b
ON a.id = b.id