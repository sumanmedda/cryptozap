# cryptozap

## Getting Started

Assignment Project

About:
    A cryptocurrency price tracking application using the Flutter framework with the BLoC state management using repository pattern.

Api Used :
    1. Coingecko Api - For Fetching Currency and details.

Installation : 
    1. Clone the repo from github
    2. Write command - flutter pub get
    3. connect a device / start emulator and run the app

Packages Used :
    1. flutter_bloc - for state management
    2. dio - for http requests (api request)
    3. pretty_dio_logger - it prints the api response in the terminal
    4. Connectivity - TO Check connectivity of internet
    5. Hive - For Local Database

Working: 
    This app will fetch data related to cryptocurrency also if internet is not connected then it will display the last data stored when the connection is back it will display the data fetched from API.

