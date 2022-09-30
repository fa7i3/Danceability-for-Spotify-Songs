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
A machine learning model was created to make predictions on the danceability of spotify songs. The target, danceability, was converted into a classification problem during the database preprocessing phase. Therefore, a classification machine learning model will examine the features as the input (X) and attempt to predict the danceability as the output (y). The machine learning model code can be found here: *[machine_learning_models.ipynb](Machine_Learning_Model/machine_learning_models.ipynb)*. 

### Data Preprocessing
For the data preprocessing phase, we:
* verified the datatypes for each column
* checked for null values and duplicate values
* moved all non-numerical values to a second dataframe and kept all numerical values on the main dataframe

### Feature Engineering
The following tasks were completed during the feature engineering phase: 
* encoded the *key* column with Scikit-learn's OneHotEncoder() module
* scaling: 
    * *loudness*, originally from -60 to 3.8 db, was scaled from 0.0 to 1.0 during the preprocessing phase
    * *tempo*, originally from 0.0 to 244 BPM, was scaled from 0.0 to 1.0 during the preprocessing phase
* scaling with StandardScaler() was attempted to improve the accuracy of the model but should be unnecessary since the values in each column are already between 0 and 1. 

### Feature Selection
The following columns from the *[merged_spotify_songs.csv](Resources/merged_spotify_songs.csv)* dataset were selected to be features for the machine learning model:

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

All the above audio features were selected because of their numerical values and strong probability for predicting danceability. Definitions for the above audio features were sourced from the *[Spotify Audio Feature Reference](https://developer.spotify.com/documentation/web-api/reference/#/operations/get-audio-features)*.

### How Data was Split into Training and Testing
In our machine learning model, we chose to split the data into 75% training and 25% testing. 

### Machine Learning Models - Choice, Benefits, and Limitations
The following supervised, classification machine learning models were incorporated in *[machine_learning_models.ipynb](Machine_Learning_Model/machine_learning_models.ipynb):*

1. Logistic Regression
2. Decision Tree
3. Balanced Random Forest Classifier
4. Easy Ensemble AdaBoost Classifier
5. Deep Neural Network

Multiple machine learning models were selected to determine which model would produce the highest accuracy. The Balanced Random Forest Classifier model and the Deep Neural Network model have the two highest accuracies of 80+%. Our models are currently unable to exceed an accuracy of 82%. Further improvements to the model and the preprocessing steps will be performed throughout the duration of the project.

The model we are currently focusing on is the Balanced Random Forest Classifier. 
| Benefits | Limitations |
| :------- | :---------- |
| Runs very quickly compared to the Easy Ensemble AdaBoost Classifier and the Deep Neural Network | Uses more computational power and resources as the output is combining hundreds of trees |
| Are robust against overfitting and robust to outliers | Requires more time to train as compared to a simple decision tree |

### Steps
The following steps summarize how we created a supervised machine learning model: 

1.	Split the data into input (X) and output (y) with danceability as the target feature
2.  Split the Data into Training and Testing: 75%/25%
3.	Define a model: model = BalancedRandomForestClassifier()
4.	Train the model with: model.fit(X_train, y_train)
5.	Make predictions with: y_pred = model.predict(X_test)
6.	Validate the model with: confusion_matrix(), balanced_accuracy_score(), and classification_report()

### Sample Results: Balanced Random Forest Classifier
The accuracy scores and classification report for our sample Random Forest Classifier model are shown below:

* This model has an accuracy of 81.1% for predicting danceability
* It achieved a precision of 0.86 and a recall of 0.81 for predicting danceability
* It achieve an average f1-score of 0.81
<img src="Images/sample_ml_results.png" width="472">

## Database

We plan to use a SQL database (PostgreSQL and pgAdmin) to store our data. 

Our dataset consists of two tables: 
- *[spotify_song_info.csv](Resources/spotify_song_info.csv)* which contains general information about each song 
- *[spotify_song_features.csv](Resources/spotify_song_features.csv)* which contains feature columns and the target column *danceability* that we plan to use for our machine learning model. 

Using pgAdmin two tables were created to store both datasets (*[query](Database/query.sql)*) and joined them to create our third table in order to store the *[merged_spotify_songs.csv](Resources/merged_spotify_songs.csv)*. 

Using Python Pandas Library in *[final_preprocessing_data .ipynb](Database/final_preprocessing_data.ipynb)*, the two tables were merged into one dataset, which was examined, cleaned, and sent to a PostgreSQL database via a connection string using SQLAlchemy into the merged_spotify_songs table previously created.

The Entity Relationship Diagram for the two tables is shown below:  
<img src="Images/ERD_spotify_database.png" width=472>

## Dashboard
We plan to use Tableau Public to create the final dashboard for the project. Few reasons why Tableau will be used are:
* It is easy to use;
* It can easily handle large data;
* It is an effetcive tool used to quickly create data visualizations;
* It offers real-time analysis;
* It can transform data into an engaging story that can be easily understood by the audience.

The final dashboard will show the number of songs, how danceability has changed throughout the years and show some factors that affects it. 

## Tableau Public
The story contains the following information:
#### Number of songs in the dataset: 
According to the picture below, there are 169,909 songs in the spotify dataset.

![number of songs](https://user-images.githubusercontent.com/104453593/192681719-56d25d32-cfad-459d-a7e2-7444d42bea6a.PNG)

#### Danceablity over the years: 
The line chart below shows that danceability has increased throughout the years (from 1921-2020)
* the x-axis represents the Year field;
* the y-axis represents the Danceability field; 
* The darker the green color, the higher the danceability.

![danceability over the years](https://user-images.githubusercontent.com/104453593/192681753-690933fb-c42d-4417-a7dd-377e4d7e3e20.PNG)

#### Factors affecting danceability: 
The line chart below shows that Energy has an effect on Danceability
* x-axis represents the Year field;
* y-axis represents the Danceability field;
* The legend shows that the green line represents Danceability and 
* the gold line represents Energy throughout the years. 
* The higher the Energy, the higher the danceability of the song. 

![danceability and energy over the years](https://user-images.githubusercontent.com/104453593/192929258-c83f8cbf-5b7b-4759-b6ba-2a39b4c378d0.PNG)

## Links

### Link to Tableau Story
[Tableau Story](https://public.tableau.com/app/profile/faith.emenike/viz/SpotifyChangeinDanceabilityDashboardOverview/Story3?publish=yes)

### Link to Google Slides Presentation
[Presentation](https://docs.google.com/presentation/d/1SLyJo5VTJr1ISsJsDj2ul_97DUWQovaDkD5HBMjirlo/edit?usp=sharing)




