import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mt_fitpage/helper/my_helper.dart';
import 'package:mt_fitpage/screens/details/controllers/detail_controller.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MT Fitpage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        //color: Colors.black38,
        child: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Container(
          color: Colors.lightBlueAccent.withOpacity(0.5),
          child: ListTile(
            title: Text(
              controller.detailSample.value.name!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              controller.detailSample.value.tag!,
              style: TextStyle(
                  color: myHelper.getColor(
                    controller.detailSample.value.color!,
                  ),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        controller.criteria.isNotEmpty ? detailsList() : Container(),
      ],
    );
  }

  Widget detailsList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: InkWell(
              onTap: () {
                controller.valuesList.isNotEmpty ? valueDialog(context) : null;
              },
              child: Text(
                controller.criteria[index]['text']!,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(left: 16),
            child: const Text(
              'and',
              style: TextStyle(color: Colors.black, fontSize: 12),
            )),
        itemCount: controller.criteria.length);
  }

  Future valueDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              width: double.minPositive,
              height: 200,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          controller.valuesList[index].toString(),
                          style: const TextStyle(
                              fontSize: 24, color: Colors.green),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.valuesList.length),
                )
              ]),
            ),
          );
        });
  }
}
