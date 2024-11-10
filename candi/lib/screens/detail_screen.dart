import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //DETAIL HEADER 
              //Gambar utama
              Stack(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      candi.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      ),
                  ),
                  ),

                  //Tombol back custon
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[100]?.withOpacity(0.8),
                        shape:  BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)
                        ),
                    )
                    ),
                ],
              ),


            ],
            ),
        ),
      )
    );
  }
}