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
        return GestureDetector(
          onTap: () => context.read<HomeScreenController>().initState(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 3,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  onPressed: () => context.read<HomeScreenController>().tap2(),
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () => context.read<HomeScreenController>().tap(),
                    icon: const Icon(
                      Icons.contact_support_rounded,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('緯度は、' + latitude),
                  Text('経度は、' + longitude),
                  Text('高度は、' + altitude),
                  Text('距離は、' + distanceInMeters),
                  Text('方角は、' + bearing),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().getLocation(),
                    child: const Text('①初めの値を設定する。'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().tap(),
                    child: const Text('②'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<HomeScreenController>().tap2(),
                    child: const Text('③'),
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
