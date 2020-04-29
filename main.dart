import 'package:flutter/material.dart';
import 'package:flutter_provider/WeatherInfo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider pattern'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialTemp(),
              MySpecialTheme(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // WeatherInfo newWeatherInfo = Provider.of<WeatherInfo>(context);
    // print('inside MySpecialTemp ${newWeatherInfo.tempType}');

    // return Text(newWeatherInfo.tempType);
    return Consumer<WeatherInfo>(
      builder: (context, weatherInfo, _) {
        return Text(weatherInfo.tempType);
      },
    );
  }
}

class MySpecialTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherInfo newWeatherInfo = Provider.of<WeatherInfo>(context);

    return Text('${newWeatherInfo.tempValue}');
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherInfo newWeatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      onPressed: () {
        String temp =
            newWeatherInfo.tempType == "Celcius" ? "Farenhite" : "Celcius";
        newWeatherInfo.tempType = temp;
        print(newWeatherInfo.tempType);
      },
      child: Icon(Icons.change_history),
    );
  }
}
