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


              //DETAIL INFO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Info atas
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(candi.name,
                        style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(onPressed: (){},
                        icon: const Icon(Icons.favorite_border))
                      ],
                      ),

                    //Info Tengah
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Icon(Icons.place, color: Colors.red),
                        const SizedBox(width: 8,),
                        const SizedBox(
                          width: 70,
                          child: Text('lokasi', style: TextStyle(
                          fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(': ${candi.location}',),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.blue),
                        const SizedBox(width: 8,),
                        const SizedBox(
                          width: 70,
                          child: Text('Dibangun', style: TextStyle(
                          fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(': ${candi.built}',),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.house, color: Colors.green),
                        const SizedBox(width: 8,),
                        const SizedBox(
                          width: 70,
                          child: Text('Type', style: TextStyle(
                          fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(': ${candi.type}',),
                      ],
                    ),
                    //PEMISAH
                    const SizedBox(height: 16,),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      ),
                    const SizedBox(height: 16,),
                    //Info bawah
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 16,),
                    Text(
                      candi.description,
                    )
                  ],
                ),
              ),
            ],
            ),
        ),
      )
    );
  }
}