import '../model/category.dart';
import 'package:flutter/material.dart';


class CategoryProvider with ChangeNotifier{
  // CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [
    CategoryModel(id:'1',
      name:'Fast Food',
      image:    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    ),
    CategoryModel(id:'2',
      name:'Salad',
      image:
      'https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad-760x983.jpg',),

    CategoryModel(id:'3',
      name:'Chicken',
      image:    'https://www.dinneratthezoo.com/wp-content/uploads/2019/06/rotisserie-chicken-3.jpg',
    ),
    // CategoryModel(id:'4',
    //   name:'Snack',
    //   image:
    //   '  https://arabicpost.net/wp-content/uploads/2019/11/istock-1164380736.jpg',),

    CategoryModel(id:'4',
      name:'Classic Hamburger',
      image:    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    ),


  ];

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories(){

    // categories = await _categoryServices.getCategories();
    // notifyListeners();
  }
}