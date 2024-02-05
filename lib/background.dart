import 'dart:ui';
import 'package:flutter/material.dart';

class backIndigo extends StatelessWidget {
  const backIndigo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      child: Transform.rotate(
        angle: 12,
        child: Container(
          width: 90,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.cyan.shade100,
              borderRadius: const BorderRadius.all(
                const Radius.circular(10),
              )),
        ),
      ),
    );
  }
}

class backSkin extends StatelessWidget {
  const backSkin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 70,
        left: 440,
        child: Transform(
          transform: Matrix4.rotationZ(0.8),
          child: Container(
            width: 87,
            height: 650,
            decoration: BoxDecoration(
              color:  Colors.lime.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ));
  }
}

class backPurple extends StatelessWidget {
  const backPurple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -20,
        left: 280,
        child: Transform(
          transform: Matrix4.rotationZ(12.3),
          child: Container(
            width: 80,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}

class backPink extends StatelessWidget {
  const backPink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -38,
        left: 600,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(10),
          child: Container(
            width: 80,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
            ),
          ),
        ));
  }
}

class backOrangeLigth extends StatelessWidget {
  const backOrangeLigth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -100,
        right: 330,
        child: Transform.rotate(
          angle: 17.92,
          child: Container(
            width: 80,
            height: 380,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}

class backRed extends StatelessWidget {
  const backRed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -5,
        right: -80,
        child: Transform(
          transform: Matrix4.rotationZ(19.84),
          child: Container(
            width: 80,
            height: 390,
            decoration: BoxDecoration(
              color: Colors.cyan.shade200,
            ),
          ),
        ));
  }
}

class backPink2 extends StatelessWidget {
  const backPink2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5,
        right: 450,
        child: Transform(
          transform: Matrix4.rotationZ(18.1),
          child: Container(
            width: 80,
            height: 470,
            decoration: BoxDecoration(
              color: Colors.yellow.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ));
  }
}

// DEGRADADO
class backFilter extends StatelessWidget {
  backFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(),
      ),
    );
  }
}

class backFilter2 extends StatelessWidget {
  backFilter2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40,
          sigmaY: 40,
        ),
        child: Container(),
      ),
    );
  }
}