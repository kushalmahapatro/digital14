
# Digital14
1. The project is using VIPER architecture where as VIPER stand for

    V = View (where the ui part is handled)
    I = Interactor (where all the interactions i.e. clicks are handled)
    P = Provider (Where the provider is handled for all the business logics and state management)
    E = Entity (Where the models linked to the view and presenter are being handled)
    R = Routes (Where the route/navigation of individual screen are being handled)

2. For state management its using Flutter Riverpod along with Flutter Hooks, there is combined package called as hooks_riverpod
    
3. For API call its using dio:
    rest_service.dart file has all the API call methods, and also before calling an API it used the connectivity plugin to check the network availibity.
    currently for this the API response are mocked, the mock the api resonse, in the reset_service method, have to pass the path for the mock resposne json file.
    To use any mock response it has to be added to the assets/mock_response folder and the json name has to be passed to restService function.
    
4. For font Google fonts plugin is used and interTextTheme is added. The whole app textTheme / font family can be easily cahnged from extensions.dart. 

5. Rather than calling the API on every text change a Debouncer has been added which will add a delay of 300 ms for every API call and will be picking up the respective text in the Input Field and send it in query.

6. The Project is using the lastest FLutter SDK i.e. 3.0.0.

7. The app has been tested in Mobile, Mac and Web, and a web version has been deployed to firebase hosting. 
    It can be viewed from https://digital14-bfc7e.web.app/#/. 

8. To install in mac, it dmg file can be downloaded form the mentioned google drive link (https://drive.google.com/file/d/1pjomf7Pp72E3b4ShxI6bvkAcBfz9l0xT/view?usp=sharing).
    took helf from this article in creating dmg file : https://retroportalstudio.medium.com/creating-dmg-file-for-flutter-macos-apps-e448ff1cb0f 





