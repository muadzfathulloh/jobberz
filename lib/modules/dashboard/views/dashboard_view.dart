import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobberz_app/constants/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jobberz_app/routes/app_routes.dart';
import 'package:jobberz_app/widgets/featured_card.dart';
import 'package:jobberz_app/widgets/recom_card.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(controller.user.value.username);
                            Get.toNamed(RoutesName.profile);
                          },
                          child: Image.asset(
                            'assets/images/profile-1.png',
                            height: Get.height * 0.05,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hallo,',
                              style: TextStyle(color: Color(0XFF274C70)),
                            ),
                            Text(
                              controller.user.value.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF274C70)),
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.openEndDrawer();
                      },
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Container(
                            width: 280,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Color(0XFFD9D9D9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 1),
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: 'Search here',
                                  icon: SvgPicture.asset(
                                      'assets/icons/search.svg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/filter.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color(0XFFD9D9D9),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Location',
                                style: TextStyle(color: Color(0XFF7A7D7E)),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0XFF7A7D7E),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Featured Jobs',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kPrimary),
                        ),
                        GestureDetector(
                          child: Text('Create'),
                          onTap: () {
                            Get.bottomSheet(
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Color(0XFF636266),
                                          ),
                                          height: 4,
                                          width: 36,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Create Job',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Nama Pekerjaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Perusahaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Kategori Pekerjaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Gaji',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Orang yang dibutuhkan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Lokasi',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: kPrimary,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Create',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: kWhite,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: kWhite,
                              isScrollControlled: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  clipBehavior: Clip.none,
                  viewportFraction: 0.84,
                  aspectRatio: 2.3,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: const [
                  FeaturedCard(
                    title: 'Backend Developer',
                    company: 'Tokopedia',
                    rate: '4.8',
                    category_1: 'Golang',
                    category_2: 'Full-Time',
                    sallary: '7.000.000 - 8.000.000',
                    people: 'Recruiting several people',
                  ),
                  FeaturedCard(
                    title: 'Mobile Developer',
                    company: 'Sindika',
                    rate: '4.6',
                    category_1: 'Flutter',
                    category_2: 'Part-Time',
                    sallary: '4.000.000 - 6.000.000',
                    people: 'Recruiting two people',
                  ),
                  FeaturedCard(
                    title: 'Design Patern',
                    company: 'Blibli',
                    rate: '4.8',
                    category_1: 'Design Patern',
                    category_2: 'Part-Time',
                    sallary: '7.000.000 - 8.000.000',
                    people: 'Recruiting several people',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recommended Jobs',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF274C70)),
                        ),
                        GestureDetector(
                          child: Text('Create'),
                          onTap: () {
                            Get.bottomSheet(
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Color(0XFF636266),
                                          ),
                                          height: 4,
                                          width: 36,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Create Job',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Nama Pekerjaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Perusahaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Kategori Pekerjaan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Gaji',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Orang yang dibutuhkan',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          //
                                          hintText: 'Lokasi',
                                          fillColor: kWhite,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: kPrimary,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Create',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: kWhite,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: kWhite,
                              isScrollControlled: true,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const RecomCard(
                      title: 'Design Patern',
                      company: 'PT. Sindika',
                      category_1: 'Design Patern',
                      category_2: 'Part-Time',
                      sallary: '7.000.000 - 8.000.000',
                      locate: 'Surabaya',
                    ),
                    const SizedBox(height: 10),
                    const RecomCard(
                      title: 'Mobile Developer',
                      company: 'PT. Mitra Informatika',
                      category_1: 'Flutter',
                      category_2: 'Full-Time',
                      sallary: '4.000.000 - 8.000.000',
                      locate: 'Surabaya',
                    ),
                    const SizedBox(height: 10),
                    const RecomCard(
                      title: 'Data Research',
                      company: 'PT. Pelinda',
                      category_1: 'Power Point',
                      category_2: 'Part-Time',
                      sallary: '3.000.000 - 5.000.000',
                      locate: 'Surabaya',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
