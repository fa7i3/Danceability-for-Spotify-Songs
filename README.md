# Danceability-of-Spotify-Songs

## Team Members:
* **Square**: Github Repository (Faith)
* **Triangle**: Machine Learning Model (Diana)
* **Circle**: Database Integration (Daniel)

## Communication Protocols: 
* Slack for quick and easy communication among team members
* Zoom meetings on Tuesday, Thursdays and Saturdays
* Additional meetings on other days if necessary

## Project Overview

### Topic: Danceability of Spotify Songs from 1921 to 2020

### Softwares Used
* Jupyter Notebook
* ERD (Entity Relationship Diagram) Tool
* pgAdmin
* Languages (Python, SQL)
* Dependencies (sqlalchemy, Pandas)

### Reasons for Selected Topic
* We were interested in determining how the danceability of songs have changed over time.
* Given that there were 188 million Spotify premium subscribers in the second quarter of 2022, we decided to use data retrieved from Spotify Web API. 
* We also wanted to find out how machine learning can predict the danceability of a song using different factors.

### Description of Dataset Source
* Dataset was downloaded from [Kaggle](https://www.kaggle.com/datasets/ektanegi/spotifydata-19212020) and captured the top 2000 songs on Spotify for each year from 1921 to 2020
* Columns include general song information and [song features](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features) which contain audio feature information for each unique Spotify Id
* Data was collected from Spotify Web API 
* Dimension of Original Dataset: 169909 rows by 19 columns

### Questions we hope to answer
* Can machine learning models predict the danceability of Spotify songs using audio feature information?
* How has danceability changed throughout the years from 1921 to 2020?
* How danceable or energetic a song is?
* How various factors can predict the danceability of a song.

## Machine Learning Model
A machine learning model was created to make predictions on the danceability of spotify songs. 

For the data preparation we checked for null values and duplicate values. Moved all non-numerical values to a second dataframe and kept all numerical values on the main dataframe with the ID column as the index. 

To create the supervised model we followed these steps: 

1.	Split the data into input (X) and output (y) with danceability as the target feature
2.  Split the Data into Training and Testing
3.  Oversample using the RandomOverSampler
2.	Create a model with model = LinearRegression().
3.	Train the model with model.fit(X,y).
4.	Make predictions with y_pred = model.predict(X).
5.	Validate the model with accuracy_score().

The accuracy scores and classification report for our machine learning model are shown below:

- Accuracy score = 0.76. This model has a 76% of accuracy at predicting danceability
- It achieved an average F-score of 0.76 

<img width="472" alt="Screen Shot 2022-09-21 at 6 23 45 PM" src="https://user-images.githubusercontent.com/104380112/191621511-8ebe750c-8c52-4bf6-a94d-90d1a595bc64.png">

## Database
We plan to use a SQL database (PostgreSQL and pgAdmin) to store our data. Our dataset consists of two tables: *[spotify_song_info.csv](Resources/spotify_song_info.csv)* which contains general information about each song and *[spotify_song_features.csv](Resources/spotify_song_features.csv)* which contains feature columns that we plan to use in our machine learning model. *spotify_song_features.csv* also contains the target column, *danceability*, for our machine learning model. The two tables will be cleaned using the Python Pandas library and merged into one dataset, *merged_spotify_songs.csv*, using SQL.   

In *[preprocessing_dataset.ipynb](Database/preprocessing_dataset.ipynb)*, the two tables are examined, cleaned, and sent to a PostgreSQL database via a connection string using SQLAlchemy. Then, a *[query](Database/query.sql)* was designed to join the two tables into *[merged_spotify_songs.csv](Resources/merged_spotify_songs.csv)*. 

The Entity Relationship Diagram for the two tables is shown below:  
<img src="Images/ERD_spotify_database.png" width=472>

## Links

### Link to Dashboard
(TBD)

### Link to Google Slides Presentation
(TBD)





