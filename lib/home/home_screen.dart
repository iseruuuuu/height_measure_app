import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'home_screen_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeScreenController, HomeScreenState>(
      create: (context) => HomeScreenController(
        context: context,
      ),
      builder: (context, _) {
        final latitude = context.select<HomeScreenState, String>((state) => state.latitude);
        final longitude = context.select<HomeScreenState, String>((state) => state.longitude);
        final altitude = context.select<HomeScreenState, String>((state) => state.altitude);
        final distanceInMeters = context.select<HomeScreenState, String>((state) => state.distanceInMeters);
        final bearing = context.select<HomeScreenState, String>((state) => state.bearing);

        final latitude2 = context.select<HomeScreenState, String>((state) => state.latitude2);
        final longitude2 = context.select<HomeScreenState, String>((state) => state.longitude2);
        final altitude2 = context.select<HomeScreenState, String>((state) => state.altitude2);
        final distanceInMeters2 = context.select<HomeScreenState, String>((state) => state.distanceInMeters2);
        final bearing2 = context.select<HomeScreenState, String>((state) => state.bearing2);

        final latitude3 = context.select<HomeScreenState, String>((state) => state.latitude3);
        final longitude3 = context.select<HomeScreenState, String>((state) => state.longitude3);
        final altitude3 = context.select<HomeScreenState, String>((state) => state.altitude3);
        final distanceInMeters3 = context.select<HomeScreenState, String>((state) => state.distanceInMeters3);
        final bearing3 = context.select<HomeScreenState, String>((state) => state.bearing3);

        return GestureDetector(
          onTap: () => context.read<HomeScreenController>().initState(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 3,
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('1回目の計測'),
                          Text('緯度は、' + latitude),
                          Text('経度は、' + longitude),
                          Text('高度は、' + altitude),
                          Text('距離は、' + distanceInMeters),
                          Text('方角は、' + bearing),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('2回目の計測'),
                          Text(latitude2),
                          Text(longitude2),
                          Text(altitude2),
                          Text(distanceInMeters2),
                          Text(bearing2),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('差分'),
                          Text(latitude3),
                          Text(longitude3),
                          Text(altitude3),
                          Text(distanceInMeters3),
                          Text(bearing3),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().getLocation(),
                    child: const Text('①初めの値を設定する。'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().tap(),
                    child: const Text('②2回目の計測'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().tap2(),
                    child: const Text('③差分のための計算'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
