import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color selectedColor = Color(0xff4cc940);
Color unSelectedColor = Color(0xffDDDDDD);

class CustomSteppers extends StatefulWidget {
  List<StepperModel> list = [];
  int pageIndex;

  CustomSteppers({this.list, this.pageIndex = 1});

  @override
  _CustomSteppersState createState() => _CustomSteppersState();
}

class _CustomSteppersState extends State<CustomSteppers> {
  List<StepperModel>_list = [];

  @override
  void initState() {
    _list = widget.list;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomSteppers oldWidget) {
    _changeStepper(widget.pageIndex);
    super.didUpdateWidget(oldWidget);
  }

  _changeStepper(int page) {
    for (int index = 0; index < _list.length; index++) {
      setState(() {
        if (index == page && _list[index].check == false) {
          _list[index].focus = true;
          _list[index].check = true;
        } else if (index == page && _list[index + 1].check == true) {
          _list[index].focus = true;
          _list[index + 1].focus = false;
          _list[index + 1].check = false;
        } else {
          _list[index].focus = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(widget.list.length, (int index) {
          if (index == 0) {
            return FirstStepper(
                model: widget.list[index],
                nextModel: widget.list[index + 1],
                count: widget.list.length);
          }
          if (index == widget.list.length - 1) {
            return LastStepper(
                model: widget.list[index], count: widget.list.length);
          }
          return MidStepper(
              model: widget.list[index],
              nextModel: widget.list[index + 1],
              count: widget.list.length);
        }));
  }
}

// ignore: must_be_immutable
class FirstStepper extends StatelessWidget {
  StepperModel model;
  StepperModel nextModel;
  int count;

  FirstStepper({this.model, this.nextModel, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / count - 8,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double size = constraints.maxHeight * 0.4;
          return Container(
              child: Stack(children: [
            Positioned(
                top: size * 0.5,
                child: Row(children: [
                  Container(width: constraints.maxWidth * 0.2),
                  Container(
                      height: 1,
                      width: constraints.maxWidth * 0.8,
                      color: nextModel.check == true
                          ? selectedColor
                          : unSelectedColor)
                ])),
            Positioned.fill(child: Row(children: [CommonWidget(model: model)]))
          ]));
        }));
  }
}

// ignore: must_be_immutable
class LastStepper extends StatelessWidget {
  StepperModel model;
  int count;

  LastStepper({this.model, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / count - 8,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double size = constraints.maxHeight * 0.4;
          return Container(
              child: Stack(children: [
            Positioned(
                top: size * 0.5,
                child: Row(children: [
                  Container(
                      height: 1,
                      width: constraints.maxWidth * 0.8,
                      color: model.check == true
                          ? selectedColor
                          : unSelectedColor)
                ])),
            Positioned.fill(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [CommonWidget(model: model)]))
          ]));
        }));
  }
}

// ignore: must_be_immutable
class MidStepper extends StatelessWidget {
  StepperModel model;
  StepperModel nextModel;
  int count;

  MidStepper({this.model, this.nextModel, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / count - 8,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double size = constraints.maxHeight * 0.4;
          return Container(
              child: Stack(children: [
            Positioned.fill(
                top: size * 0.5,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Row(children: [
                      Expanded(
                          child: Container(
                              height: 1,
                              color: model.check == true
                                  ? selectedColor
                                  : unSelectedColor)),
                      Expanded(
                          child: Container(
                              height: 1,
                              color: nextModel.check == true
                                  ? selectedColor
                                  : unSelectedColor))
                    ]))),
            Positioned(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: CommonWidget(model: model)))
          ]));
        }));
  }
}

// ignore: must_be_immutable
class CommonWidget extends StatelessWidget {
  StepperModel model;
  double radius = 900;

  CommonWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double size = constraints.maxHeight * 0.4;
      return Column(children: [
        Container(
            padding: EdgeInsets.all(size * 0.20),
            height: size,
            width: size,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                    color:
                        model.focus == true ? selectedColor : unSelectedColor,
                    width: model.focus == true ? 1.5 : 1)),
            child: model.check == true
                ? Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(radius)))
                : Container()),
        SizedBox(height: 12),
        Expanded(
            child: Text(model.title,
                style: TextStyle(
                    color: model.check == true
                        ? Colors.black
                        : Color(0xff9a9a9a),
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
                maxLines: 1))
      ]);
    });
  }
}


class StepperModel {
  String title;
  bool check;
  bool focus;
  Color backColor;

  StepperModel(
      {this.title,
      this.check = false,
      this.focus = false,
      this.backColor = const Color(0xffececec)});
}
