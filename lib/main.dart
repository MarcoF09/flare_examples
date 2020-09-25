import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
// import 'package:flarel1/character_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FlareController {
  double _speed = 1.0;

  double _lungeTime = 0.0;
  double _lungeAmount = 0.5;

  double _sittingTime = 0.0;
  double _sittingAmount = 0.5;

  double _armsUpTime = 0.0;
  double _armsUpAmount = 0.5;

  // CharacterController _controller = new CharacterController();
  ActorAnimation _lunge;
  ActorAnimation _sitting;
  ActorAnimation _armsUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(title: new Text('Niroga -- Flare')),
      body: new FlareActor(
        "assets/Character_1BINARY.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "Arms_up",
        controller: this,
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _lungeTime += elapsed * _speed;

    // _sittingTime += elapsed * _speed;

    // _armsUpTime += elapsed * _speed;

    // artboard
    //     .getAnimation('Sitting')
    //     .apply(_sittingTime % _sitting.duration, artboard, _sittingAmount);
    _lunge.apply(_lungeTime % _lunge.duration, artboard, _lungeAmount);
    // _armsUp.apply(_armsUpTime % _armsUp.duration, artboard, _armsUpAmount);

    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _lunge = artboard.getAnimation("Lunge");
    _sitting = artboard.getAnimation("Sitting");
    _armsUp = artboard.getAnimation("Arms_up");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
}
