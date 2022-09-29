# Danceability-of-Spotify-Songs

## Team Members:
* Faith: Github Repository
* Daniel: Machine Learning Model
* Diana: Database Integration

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
* Tableau Public
* Languages (Python, SQL)
* Dependencies (sqlalchemy, Pandas, TensorFlow, Scikit-learn)

### Reasons for Selected Topic

- **Mutual Interest** - Music is a popular topic and a common interest amongst the team. Although we like different genres we all listen to music on a daily basis and has become an important factor in our lives
- **Growing Industry** - The music industry is continuously growing and nhas become more accessible than ever with multiple streaming options. Spotify recorded 188 million Spotify premium subscribers in the second quarter of 2022 and has 60,000 songs being uploaded every day
- **Interested in Learning** - How the danceability of songs have changed over time and if a machine learning can predict the danceability of a song based on different factors

### Description of Dataset Source
* Dataset was downloaded from [Kaggle](https://www.kaggle.com/datasets/ektanegi/spotifydata-19212020) and captured the top 2000 songs on Spotify for each year from 1921 to 2020
* Columns include general song information and [song features](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features) which contain audio feature information for each unique Spotify Id
* Data was collected from Spotify Web API 
* Dimension of Original Dataset: 169,909 rows by 19 columns

### Questions we hope to answer
* Can machine learning models predict the danceability of Spotify songs using audio feature information?
* How has danceability changed throughout the years from 1921 to 2020?
* How danceable or energetic a song is?
* How various factors can predict the danceability of a song.

## Machine Learning Model

### Purpose
A machine learning model was created to make predictions on the danceability of spotify songs. The target, danceability, was converted into a classification problem during the database preprocessing phase. Therefore, classification machine learning models will examine the features as the input (X) and attempt to predict the danceability as the output (y). 

### Data Preprocessing
For the data preparation we checked for null values and duplicate values. Moved all non-numerical values to a second dataframe and kept all numerical values on the main dataframe with the ID column as the index. 

### Feature Engineering and Selection
The following columns from the *merged_spotify_songs.csv* dataset were selected to be features for the machine learning models:
* acousticness
* danceability (target)
* energy
* explicit
* instrumentalness
* key
* liveness
* loudness_scaled
* mode
* popularity
* speechiness
* tempo_scaled
* valence

### Machine Learning Models - Choice, Benefits, and Limitations
The following machine learning models were incorporated in [machine_learning_models.ipynb](Machine_Learning_Model/machine_learning_models.ipynb):

1. Logistic Regression
2. Decision Tree
3. Balanced Random Forest Classifier
4. Easy Ensemble AdaBoost Classifier
5. Deep Neural Network

Multiple machine learning models were selected to determine which model would produce the highest accuracy. The Balanced Random Forest Classifier model and the Deep Neural Network model both have the top 2 accuracies of greater-than 80%. Currently our models are unable to exceed an accuracy of 81%. Further improvements to the model and the preprocessing steps will be performed throughout the duration of the project.  

### Steps
To create the supervised model we followed these steps: 

1.	Split the data into input (X) and output (y) with danceability as the target feature
2.  Split the Data into Training and Testing
3.  Oversample using the RandomOverSampler
4.	Define a model (e.g model = LogisticRegression())
5.	Train the model with model.fit(X,y).
6.	Make predictions with y_pred = model.predict(X).
7.	Validate the model with accuracy_score().

### Sample Machine Learning Model: Logistic Regression
The accuracy scores and classification report for our Logistic Regression model are shown below:

- Accuracy score = 0.76. This model has a 76% of accuracy at predicting danceability
- It achieved an average F-score of 0.76 

<img width="472" alt="Screen Shot 2022-09-21 at 6 23 45 PM" src="https://user-images.githubusercontent.com/104380112/191621511-8ebe750c-8c52-4bf6-a94d-90d1a595bc64.png">

## Database
We plan to use a SQL database (PostgreSQL and pgAdmin) to store our data. Our dataset consists of two tables: *[spotify_song_info.csv](Resources/spotify_song_info.csv)* which contains general information about each song and *[spotify_song_features.csv](Resources/spotify_song_features.csv)* which contains feature columns that we plan to use in our machine learning model. *spotify_song_features.csv* also contains the target column, *danceability*, for our machine learning model. The two tables will be cleaned using the Python Pandas library and merged into one dataset, *merged_spotify_songs.csv*, using SQL.   

In *[preprocessing_dataset.ipynb](Database/preprocessing_dataset.ipynb)*, the two tables are examined, cleaned, and sent to a PostgreSQL database via a connection string using SQLAlchemy. Then, a *[query](Database/query.sql)* was designed to join the two tables into *[merged_spotify_songs.csv](Resources/merged_spotify_songs.csv)*. 

The Entity Relationship Diagram for the two tables is shown below:  
<img src="Images/ERD_spotify_database.png" width=472>

## Dashboard
We plan to use Tableau to create the final dashboard for the project. Few reasons why Tableau will be used are:
* It is easy to use;
* It is an effetcive tool used to quickly create data visualizations;
* It can transform data into an engaging story that can be easily understood by the audience.

The final dashboard will show the number of songs, how danceability has changed throughout the years and show some factors that affects it. 

## Tableau
The picture below contains the following information:
* Number of songs in the dataset: According to the picture below, there are 169,909 songs in the spotify dataset.

![number of songs](https://user-images.githubusercontent.com/104453593/192681719-56d25d32-cfad-459d-a7e2-7444d42bea6a.PNG)

* Danceablity over the years: According to the linechart below, the darker the green color, the higher the danceability which shows that danceability has increased throughout the years (from 1921-2020).

![danceability over the years](https://user-images.githubusercontent.com/104453593/192681753-690933fb-c42d-4417-a7dd-377e4d7e3e20.PNG)

* Factors affecting danceability: The line chart shows that Energy has an effect on the danceability, therefore, the higher the Energy, the higher the danceability of the song. 

![danceability and energy over the years](https://user-images.githubusercontent.com/104453593/192929258-c83f8cbf-5b7b-4759-b6ba-2a39b4c378d0.PNG)

## Links

### Link to Tableau Story
[Tableau Story](https://public.tableau.com/app/profile/faith.emenike/viz/SpotifyChangeinDanceabilityDashboardOverview/Story3?publish=yes)

### Link to Google Slides Presentation
[Presentation](https://docs.google.com/presentation/d/1SLyJo5VTJr1ISsJsDj2ul_97DUWQovaDkD5HBMjirlo/edit?usp=sharing)




