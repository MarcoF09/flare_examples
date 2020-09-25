import 'dart:async';

import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class CharacterController extends FlareController {
  FlutterActorArtboard _artboard;
  ActorAnimation _armsAnimation;
  // FlareAnimationLayer _sittingAnimation;
  ActorAnimation _lungeAnimation;
  final List<FlareAnimationLayer> _roomAnimations = [];

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _artboard = artboard;
    double timeInSeconds = 0.0;
    double runMix = 0.5; // ramp this from 0-1 as you transition to run

    // _armsAnimation.apply(timeInSeconds, artboard, 1.0);
    _lungeAnimation.apply(timeInSeconds, artboard, runMix);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _artboard = artboard;
    _armsAnimation = _artboard.getAnimation("Arms_up");
    // _sittingAnimation = FlareAnimationLayer()
    //   ..animation = _artboard.getAnimation("Sitting");
    _lungeAnimation = _artboard.getAnimation("Lunge");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
