import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/theme.dart';
import '../../../../common/constant.dart';
import '../../global_component/common_button.dart';

class OrderPageDetailView extends GetView<OrderPageController> {
  const OrderPageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,

      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SvgPicture.asset(
                icBack,
                width: 15,
                height: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "Detail Order",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              ),
            ],
          )),

      //tambah cost
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListTile(
              tileColor: greenGrass,
              title: const Text(
                "Pesanan terkonfirmasi",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("Pesanan telah dikonfirmasi oleh AlyaaRana"),
              trailing: Column(
                children: [
                  SvgPicture.asset(
                    icSuccesful,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                "Order Id",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "A-6WC8S6DWWG20",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    icTotalOrder,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(icPerson),
                  ),
                  title: const Text(
                    "Alyaa Rana",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pos 1 - Gazebo",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Pos ini terletak di gazebo dekat gerbang kedua.",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "20 Jan 2024, 1:54 pm",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                const Divider(
                  color: blackColor80,
                  thickness: 1.0,
                  indent: 20,
                  endIndent: 20,
                ),
                const ListTile(
                  title: Text(
                    "Note",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "hgfdsertyuiop-987tresxcvhji765rchyt75tgbjuyytre",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10),
                const ListTile(
                  title: Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(sampleImage, width: 50, height: 50),
                      SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("1x"),
                              SizedBox(width: 5),
                              Text("PAHE Geprek"),
                              SizedBox(width: 175),
                              Text("Rp 20.000"),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Pedas"),
                              SizedBox(width: 5),
                              Text("+"),
                              SizedBox(width: 5),
                              Text("Es Teh"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const ListTile(
                  title: Text(
                    "Note",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Dana",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  title: Text(
                    "Pembayaran",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SubTotal"),
                          SizedBox(width: 175),
                          Text("Rp 20.000"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Biaya admin"),
                          SizedBox(width: 175),
                          Text("Rp 20.000"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Potongan pengguna baru"),
                          SizedBox(width: 175),
                          Text("Rp 20.000"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: blackColor80,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  title: Text(
                    "Total",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: Text(
                    "Rp. 11.000",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "Penilaian",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    width: 100, // Adjust the width as needed
                    child: CommonButton(
                        text: "Balas", onPressed: controller.validateForm),
                  ),
                ),
                ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(icPerson),
                    ),
                    title: const Text(
                      "AlyaaRana",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Row(
                        children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(
                          icStar,
                          width: 20,
                          height: 20,
                        ),
                      );
                    }))),
                Container(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Menjadikan elemen-elemen berada di sebelah kiri
    children: [
      Text(
        "Makanan nya enak 👌",
        style: TextStyle(fontSize: 17),
      ),
      SizedBox(
        height: 10,
      ), // Menambah jarak antara teks dan gambar
      Row(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0), // Memberikan jarak antar gambar
            child: Image.asset(
              sampleImage,
              width: 70,
              height: 70,
            ),
          );
        }),
      ),
      SizedBox(height: 5),
    ],
  ),
),

              ],
            ),
          ]),
        ),
      ),
    );
  }
}
