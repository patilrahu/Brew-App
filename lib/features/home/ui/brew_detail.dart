import 'package:brewy_app/features/home/model/brew_model.dart';
import 'package:brewy_app/widgets/app_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrewDetail extends StatelessWidget {
  BrewModel brewData;
  BrewDetail({super.key, required this.brewData});

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                brewData.name ?? "",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                brewData.breweryType ?? "",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),

              SizedBox(height: 20),

              Text(
                "Address",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),

              Text(brewData.street ?? "", style: TextStyle(fontSize: 16)),
              Text(
                "${brewData.city ?? ""}, ${brewData.stateProvince ?? ""}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "${brewData.country ?? ""} - ${brewData.postalCode ?? ""}",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 20),

              Text(
                "Coordinates",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),

              Text("Latitude : ${brewData.latitude}"),
              Text("Longitude : ${brewData.longitude}"),

              SizedBox(height: 20),

              if (brewData.phone != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("${brewData.phone}"),
                    SizedBox(height: 20),
                  ],
                ),

              if (brewData.websiteUrl != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Website",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(brewData.websiteUrl!));
                      },
                      child: Text(
                        brewData.websiteUrl!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
