import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/constants/theme.dart';
import 'package:jobberz_app/modules/dashboard/controllers/dashboard_controller.dart';

class DetailJobView extends StatelessWidget {
  DetailJobView({super.key});
  final DashboardController controller = Get.find();
  final dynamic job = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset('assets/icons/back-button.svg'),
              ),
              // SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            controller.jobs[job].jobName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 18, fontWeight: semiBold),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            controller.jobs[job].company,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kategori',
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: const Text(
                            'Flutter',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rate',
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            controller.jobs[job].rate,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            style: TextStyle(color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rekrut Perusahaan',
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            'Dibutuhkan 2 Orang',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gaji',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            'Rp.${controller.jobs[job].sallary}/bulan',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lokasi',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            'Surabaya',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Created at',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            controller.jobs[job].createdAt.toString(),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, color: kPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: kBlack,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.3),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: OutlinedButton(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 16, fontWeight: semiBold, color: kPrimary),
                    ),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(color: kPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              InkWell(
                onTap: () {},
                child: Container(
                  width: Get.width,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 16,
                        color: kWhite,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
