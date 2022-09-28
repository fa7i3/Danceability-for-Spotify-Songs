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
A machine learning model was created to make predictions on the danceability of spotify songs. The target, danceability, was converted into a classification problem during the database preprocessing phase. Therefore, a classification machine learning model will examine the features as the input (X) and attempt to predict the danceability as the output (y). The machine learning model code can be found here: [machine_learning_models.ipynb](Machine_Learning_Model/machine_learning_models.ipynb). 

### Data Preprocessing
For the data preprocessing phase, we:
* verified the datatypes for each column
* checked for null values and duplicate values
* moved all non-numerical values to a second dataframe and kept all numerical values on the main dataframe
* encoded the key column with Scikit-learn's OneHotEncoder module

### Feature Engineering
* talk about encoding 
* scaling during preprocessing, loudness and tempo
* scaling after X/y spliting

### Feature Selection
The following columns from the *merged_spotify_songs.csv* dataset were selected to be features for the machine learning model:

| Feature | Description |
| :------ | :---------- |
| acousticness | confidence measure of whether the track is acoustic |
| danceability (target) | whether the track is suitable for dancing |
| energy | perceptual measure of intensity and activity |
| explicit | whether the track contains explicit language | 
| instrumentalness | predicts whether a track contains no vocals |
| key | key the track is in (i.e 0 = C, 1 = C#/D♭, 2 = D, 3 = D#/E♭, ... , 11 = B) |
| liveness | detects presence of audience |
| loudness_scaled | scaled loudness of track in dB |
| mode | modality of a track (1 = major,  0 = minor) |
| popularity | calculated by total number of plays and how recent plays are |
| speechiness | detects presence of spoken words |
| tempo_scaled | scaled tempo of track in BPM | 
| valence | describes the musical positiveness conveyed by a track | 

All the above audio features were selected because of their numerical values and strong probability for predicting danceability. Definitions for the above audio features were sourced from [Spotify Audio Feature Reference](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features)


### How Data was Split into Training and Testing
In our machine learning model, we chose to split the data into **75% training and 25% testing**. 

### Machine Learning Models - Choice, Benefits, and Limitations
The following supervised, classification machine learning models were incorporated in [machine_learning_models.ipynb](Machine_Learning_Model/machine_learning_models.ipynb):

1. Logistic Regression
2. Decision Tree
3. Balanced Random Forest Classifier
4. Easy Ensemble AdaBoost Classifier
5. Deep Neural Network

Multiple machine learning models were selected to determine which model would produce the highest accuracy. The Balanced Random Forest Classifier model and the Deep Neural Network model have the two highest accuracies of 80+%. Our models are currently unable to exceed an accuracy of 81%. Further improvements to the model and the preprocessing steps will be performed throughout the duration of the project.

### Steps
The following steps summarize how we created supervised machine learning model: 

1.	Split the data into input (X) and output (y) with danceability as the target feature
2.  Split the Data into Training and Testing (75%/25%)
3.  Oversample using the RandomOverSampler
4.	Define a model (e.g model = LogisticRegression())
5.	Train the model with model.fit(X_resampled,y_resampled)
6.	Make predictions with y_pred = model.predict(X_test)
7.	Validate the model with balanced_accuracy_score() and classification_report()

### Sample Results: Logistic Regression
The accuracy scores and classification report for our Logistic Regression model are shown below:

- Accuracy score = 0.76. This model has a 76% of accuracy at predicting danceability
- It achieved an average F-score of 0.76 

<img width="472" alt="Screen Shot 2022-09-21 at 6 23 45 PM" src="https://user-images.githubusercontent.com/104380112/191621511-8ebe750c-8c52-4bf6-a94d-90d1a595bc64.png">

## Database
We plan to use a SQL database (PostgreSQL and pgAdmin) to store our data. Our dataset consists of two tables: *[spotify_song_info.csv](Resources/spotify_song_info.csv)* which contains general information about each song and *[spotify_song_features.csv](Resources/spotify_song_features.csv)* which contains feature columns that we plan to use in our machine learning model. *spotify_song_features.csv* also contains the target column, *danceability*, for our machine learning model. The two tables will be cleaned using the Python Pandas library and merged into one dataset, *merged_spotify_songs.csv*, using SQL.   

In *[preprocessing_dataset.ipynb](Database/preprocessing_dataset.ipynb)*, the two tables are examined, cleaned, and sent to a PostgreSQL database via a connection string using SQLAlchemy. Then, a *[query](Database/query.sql)* was designed to join the two tables into *[merged_spotify_songs.csv](Resources/merged_spotify_songs.csv)*. 

The Entity Relationship Diagram for the two tables is shown below:  
<img src="Images/ERD_spotify_database.png" width=472>

## Tableau
The picture below contains the following information:
* Number of songs in the dataset;
* Danceablity over the years;
* Factors affecting danceability.


![tableau dashboard](https://user-images.githubusercontent.com/104453593/192433022-b7a6dc6b-905f-4f5a-9d9c-e42f82dfafe9.PNG)


According to the picture above, there are 169,909 songs in the spotify dataset and danceability increased throughout the years (from 1921-2020). 
According to the piechart in the picture above, the darker the green color, the higher the danceability which shows that danceability increased throughout the years (from 1921-2020). The scatter plot shows that the higher the Energy and Tempo, the higher the danceability of the song and Instrumentalness of a song has little or no effect on its danceability.

## Links

### Link to Dashboard
[Tableau Dashboard](https://public.tableau.com/app/profile/faith.emenike/viz/SpotifyDanceabilityDashboard/Dashboard2?publish=yes)

### Link to Google Slides Presentation
[Presentation](https://docs.google.com/presentation/d/1SLyJo5VTJr1ISsJsDj2ul_97DUWQovaDkD5HBMjirlo/edit?usp=sharing)




