
  
  

## Film Fan
  

## About The Project

  
### Film fan dashboard

 <img width="190" alt="films" src="https://user-images.githubusercontent.com/73523419/174406280-884b1eb7-ab50-4b68-ab44-2b4f1beda41f.PNG">


### Details page

  
<img width="192" alt="details" src="https://user-images.githubusercontent.com/73523419/174406299-ee8de1f6-bbdd-4ad2-ac86-8ef163cac644.PNG">

#### Build with

- Cubits
- Flutter widgets
- public [API](https://developers.themoviedb.org/)
- http
- JsonSeriazable
- Json Annotation
- MockingJail
- Bloc test 

## Getting Started

  

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

  

### How to use

 1. **Step one**

     Download and or clone this repo by using the link below:
		
    ``git@github.com:dmutoni/film_fan.git``
2. **Step two**
Go to project root and execute the following command in console to get the required dependencies:

    ``
flutter pub get
``
3. **Step three**
This project uses `inject` library that works with code generation, execute the following command to generate files:
````
flutter packages pub run build_runner build --delete-conflicting-outputs
````

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```
 ### Features of Film Fan
 

 - Splash
 - Film fan movies
 - Favourites page
 - Details page
 - Routing
 - Bloc/cubits (State management Library)
 
 ### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
|-packages
	|-movies
		|-movies_api
		|-movies_repository
	|-credits
		|-credits_api
		|-credits_repository
```
 Here is the folder structure we have been using in this project

```
lib/
|- app/
|- constants/
|- screens/
|- shared/
|- utils/
|- main_development.dart/
|- main_production.dart
|- main_staging.dart
```


Mutoni U. Denyse - [mutoni_u](https://twitter.com/mutoni_u) - [mdenyse15@gmail.com](mailto:mdenyse15@gmail.com)

