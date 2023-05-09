
import "package:beer_app/presentation/widgets/widget.details_beer.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:shimmer/shimmer.dart";

import "../../data/models/beer.dart";



class BeerMasonryLayout extends StatefulWidget{
  final List<Beer> beers;
  final ScrollController controller;
  final ValueListenable<Box<Uint8List>> imageListenable;
  final bool isFinalPage;

  const BeerMasonryLayout({
    super.key,
    required this.beers, required this.controller, required this.imageListenable, required this.isFinalPage,
  });
  @override
  State<BeerMasonryLayout> createState() => _BeerMasonryLayoutState();
}

class _BeerMasonryLayoutState extends State<BeerMasonryLayout> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: CustomScrollView(
              controller: widget.controller,
              slivers:  [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  sliver: SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 14,
                        mainAxisExtent: 300
                    ),
                    itemBuilder: (_,index){
                      if (index >= widget.beers.length && !widget.isFinalPage){
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).colorScheme.background,
                          highlightColor: Theme.of(context).colorScheme.onBackground,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              )
                            ],
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsBeerWidget(beer: widget.beers[index]))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder<Box<Uint8List>>(
                              valueListenable: widget.imageListenable ,
                              builder: (BuildContext context,  Box<Uint8List> value, Widget? child){
                                return Container(
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: value.containsKey(
                                              widget.beers[index].id.toString())
                                              ? MemoryImage(value
                                              .get(widget.beers[index].id!.toString())!)
                                              : NetworkImage(
                                            widget.beers[index].imageUrl ?? '',
                                          ) as ImageProvider,
                                          fit: BoxFit.fitHeight
                                      ),
                                    )
                                );
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.beers[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700, fontSize: 14),
                                      maxLines:2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );

                    },
                  ),
                ),
                if (widget.isFinalPage)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          "No more beer are online !",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )
              ],
            )
        )

    );
  }
}

