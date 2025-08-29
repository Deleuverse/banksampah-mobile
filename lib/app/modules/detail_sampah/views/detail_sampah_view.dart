import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/base/base_view.dart';
import '../controllers/detail_sampah_controller.dart';

class DetailSampahView extends BaseView<DetailSampahController> {
  const DetailSampahView({super.key});



  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "image_sampah",
            child: Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://icon2.cleanpng.com/ci3/ych/wsm/arcm09i2b.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text('Harga: ${controller.sampah.hargaPengepulRp}'),
          SizedBox(height: 8.0),
          Text('Deskripsi: ${controller.sampah.deskripsi}'),
        ],
      ),
    );
  }
}
