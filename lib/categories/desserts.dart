import 'package:dynamic_mob_recipe/foodLists/dessert.dart';
import 'package:dynamic_mob_recipe/pages/dessertsDetails.dart';
import 'package:dynamic_mob_recipe/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Desserts extends StatefulWidget {
  @override
  _DessertsState createState() => _DessertsState();
}

class _DessertsState extends State<Desserts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dessert Recipes",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          shrinkWrap: false,
          itemCount: DessertsPizza.desserts.length,
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
                          builder: (context) => DessertDetails(
                                dessertRecipe: DessertsPizza.desserts[index],
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
                        tag: DessertsPizza.desserts[index],
                        child: FadeInImage(
                          image: NetworkImage(DessertsPizza.desserts[index].imageUrl),
                          fit: BoxFit.cover,
                          placeholder: AssetImage('images/loading.gif'),
                        ),
                      ),
                      footer: Container(
                        color: pryCol.withAlpha(140),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            DessertsPizza.desserts[index].title,
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