import 'package:dynamic_mob_recipe/foodLists/cakes_and_ng.dart';
import 'package:dynamic_mob_recipe/pages/cakeDetails.dart';
import 'package:dynamic_mob_recipe/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cakes extends StatefulWidget {
  @override
  _CakesState createState() => _CakesState();
}

class _CakesState extends State<Cakes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cake Recipes",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          shrinkWrap: false,
          itemCount: Data.cakes.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CakeDetails(
                                cakeRecipe: Data.cakes[index],
                              )));
                },
                child: Card(
                  //color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GridTile(
                      child: Hero(
                        tag: Data.cakes[index].id,
                        child: FadeInImage(
                          image: NetworkImage(Data.cakes[index].imageUrl),
                          fit: BoxFit.cover,
                          placeholder: AssetImage('images/loading.gif'),
                        ),
                      ),
                      footer: Container(
                        color: pryCol.withAlpha(140),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            Data.cakes[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}