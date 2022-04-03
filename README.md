# CocktailsZone
This App provides information about all kinds of cocktails and helps people discover all-time favourite and new recipes of different drinks to jazz 
up their lives. 

# Description 

1. Allow the user to discover what the App offers by showing the onboarding 
 - Onboarding only shows up only when the user opens the App for the first time.
 - The skip button let's the user to skip the onboarding altogether.

  ![Onboarding](https://user-images.githubusercontent.com/85555767/161439807-553b5fcc-41a8-4641-9ca3-ec704c2d3a5c.gif)

2. Allow the user to login and register into the application, using FireBase.
 - The app must have an internet connection available.
 - The app has to save locally the information of the logged-in user to keep the user logged in.
 - Through the registration process the Email must have valid format and the password must meet the complexity requirements.
 - The app has to save the information of the logged-in user.
 
  ![Register](https://user-images.githubusercontent.com/85555767/161439915-814c8f13-1912-4d4d-92a1-f59ec22f5cc6.gif)
  ![Login](https://user-images.githubusercontent.com/85555767/161440159-cee230b6-9e00-4d7d-9910-f1f6485020c9.gif)

3. Allow the user to browse and search thorough all available drinks.
 - The app has to connect to the API link, retrieve all drinks and relative assets and show them to the user.
 - The app has to grant the user the possibility to see and scroll through all the available browsed drinks and cocktails.
 
 ![Search](https://user-images.githubusercontent.com/85555767/161440616-9168ce4a-cb7c-4206-9635-d71d196c3e2b.gif)
 ![Filter](https://user-images.githubusercontent.com/85555767/161440295-87cfe28d-3f13-4d48-bc24-fc046314a2ce.gif)

4. Allow the user to see ingredients and recipe for any drink.
 - The app has to show detailed information about all the ingredients required to prepare a cocktail.
 
 ![Choose](https://user-images.githubusercontent.com/85555767/161440751-0435b0d9-f3dc-4082-b126-12303a33df17.gif)

5. Allow the user to share selected drinks outside the App.
 - The app has to add your selected drinks using CoreData to the favourites, take screenshots and offer user to share.
 
 ![Favourite](https://user-images.githubusercontent.com/85555767/161440336-bd587485-a7fc-481a-ac43-b542c6bd1b66.gif)
 ![share](https://user-images.githubusercontent.com/85555767/161440817-c14aa961-aecc-4548-899c-b52a4c6b6a0b.gif)

6. Allow the user to logout of the application.
 - The app has to be able to show the user his profile information with possibility of changing user's profile photo. 
 - The app has to provide a way to perform logout.
 
   ![Settings](https://user-images.githubusercontent.com/85555767/161441009-d035cd89-76a5-43df-8b0f-dfa21273a4b5.gif)
   ![Logout](https://user-images.githubusercontent.com/85555767/161440937-5fbb126e-25c4-424c-854a-655a44239ebc.gif)

7. The app has to be available for all the iPhone versions.
 - The app has to recognize which device is being used by the user.
 
# Build With 
- XCode 13.3 
- Swift 5.5

# Architecture
- MVVM
