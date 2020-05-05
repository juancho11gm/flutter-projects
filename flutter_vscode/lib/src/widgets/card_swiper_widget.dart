import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vscode/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({ @required this.movies });
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
    padding: EdgeInsets.only(top: 5.0),
    child: Swiper(
    layout: SwiperLayout.STACK,
    itemWidth: _screenSize.width * 0.6,
    itemHeight: _screenSize.height* 0.4,
        itemBuilder: (BuildContext context,int index){
          
          movies[index].uniqueId = '${movies[index].id}-cards';

          return Hero(
                    tag: movies[index].uniqueId,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: GestureDetector(
                        child: FadeInImage(
                        image: NetworkImage(
                          movies[index].getPosterImg()
                        ),
                        placeholder: AssetImage('assets/img/loading.jpg'),
                      ),
                       onTap: (){
                          Navigator.pushNamed(context, 'details', arguments: movies[index] );
                      }
                    ),
            ),
          );
        },
        itemCount: movies.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      )
    );
  }
}