CREATE TABLE "spotify_song_info" (
    "id" varchar   NOT NULL,
    "name" varchar   NOT NULL,
    "artists" varchar   NOT NULL,
    "release_date" date   NOT NULL,
    "year" int   NOT NULL,
    "duration_ms" int   NOT NULL,
    CONSTRAINT "pk_spotify_song_info" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "spotify_song_features" (
    "id" varchar   NOT NULL,
    "acousticness" float   NOT NULL,
    "danceability" bool   NOT NULL,
    "energy" float   NOT NULL,
    "explicit" bool   NOT NULL,
    "instrumentalness" float   NOT NULL,
    "key" int   NOT NULL,
    "liveness" float   NOT NULL,
    "loudness" int   NOT NULL,
    "mode" bool   NOT NULL,
    "popularity" int   NOT NULL,
    "speechiness" float   NOT NULL,
    "tempo" float   NOT NULL,
    "valence" float   NOT NULL,
    CONSTRAINT "pk_spotify_song_features" PRIMARY KEY (
        "id"
     )
);

