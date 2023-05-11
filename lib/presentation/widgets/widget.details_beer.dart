import 'dart:typed_data';

import 'package:beer_app/data/models/beer.dart';
import 'package:beer_app/presentation/viewmodel/viewmodel.detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';



class DetailsBeerWidget extends StatelessWidget{

  final Beer beer;

  const DetailsBeerWidget({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return DetailsViewModel.buildWithProvider(builder: (_,__) => const DetailsContent() , beer: beer) ;
  }

}

class DetailsContent extends StatefulWidget {
  const DetailsContent({super.key});


  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.read<DetailsViewModel>().beer.isFavorite!;
    bool isLoading = false;

    Future<void> update() async {
      setState(() {
        isLoading = true;
      });

      try {
        final response = await context.read<DetailsViewModel>().handleFavorite();

        setState(() {
          isLoading = false;
          isFavorite = !isFavorite;
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.onSurfaceVariant,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          IconButton(
            onPressed: update,
            icon: isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),

          ),
        ],
        title: Center(
          child: Text(
            context.read<DetailsViewModel>().beer.name,
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.onSurfaceVariant,
              decorationThickness: 2,
              shadows: [Shadow(color: Theme.of(context).colorScheme.onSurfaceVariant,offset: const Offset(0, -5))],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ValueListenableBuilder<Box<Uint8List>>(
                  valueListenable: context.read<DetailsViewModel>().imageListenable,
                  builder: (BuildContext context,  Box<Uint8List> value, Widget? child){
                    return Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: value.containsKey(
                                  context.read<DetailsViewModel>().beer.id.toString()
                              ) ? MemoryImage(value.get(context.read<DetailsViewModel>().beer.id.toString())!
                              ) : NetworkImage(
                                  context.read<DetailsViewModel>().beer.imageUrl
                              ) as ImageProvider,
                              fit: BoxFit.fitHeight
                          ),
                        )
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text( "\"${context.read<DetailsViewModel>().beer.tagline}\"",
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                context.read<DetailsViewModel>().beer.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}