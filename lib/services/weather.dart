import 'location.dart';
import 'networking.dart';

const kApiKey = '5e993c4377d33bc36dc45ceb1ad6ff4e';
const kWeatherApiUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    // get user coordinates
    Location location = Location();
    await location.getCurrentLocation();

    // Get weather data
    NetworkHelper network = NetworkHelper(
        '$kWeatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&APPID=$kApiKey&units=metric');

    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
