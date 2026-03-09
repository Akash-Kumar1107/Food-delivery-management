import '../models/food_model.dart';

class MenuData {
  static const List<String> blocks = ['A-Block', 'C-Block Basement'];

  static List<String> categoriesForBlock(String block) {
    switch (block) {
      case 'A-Block': return ['Pizzas & Pastas', 'Sandwiches & Burgers', 'Rolls & Puffs', 'Snacks & Sides', 'Desserts', 'Milkshakes', 'Beverages'];
      case 'C-Block Basement': return ['North Indian', 'South Indian', 'Parathas', 'Chinese & Rice', 'Momos', 'Snacks & Quick Bites'];
      default: return [];
    }
  }

  static final List<FoodItem> allItems = [
    // === A-BLOCK ===
    const FoodItem(id:'a01',name:'Mix Veg Pizza',category:'Pizzas & Pastas',block:'A-Block',price:140,imageUrl:'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&fit=crop',description:'Loaded with fresh veggies & mozzarella'),
    const FoodItem(id:'a02',name:'Cheese Corn Pizza',category:'Pizzas & Pastas',block:'A-Block',price:160,imageUrl:'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400&fit=crop',description:'Sweet corn with extra cheese topping'),
    const FoodItem(id:'a03',name:'Paneer Pizza',category:'Pizzas & Pastas',block:'A-Block',price:160,imageUrl:'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&fit=crop',description:'Spicy paneer tikka on cheesy base'),
    const FoodItem(id:'a04',name:'Chicken Pizza',category:'Pizzas & Pastas',block:'A-Block',price:180,imageUrl:'https://images.unsplash.com/photo-1588315029754-2dd089d39a1a?w=400&fit=crop',description:'Juicy grilled chicken with herbs',isVeg:false),
    const FoodItem(id:'a05',name:'White Sauce Pasta',category:'Pizzas & Pastas',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400&fit=crop',description:'Creamy white sauce penne pasta'),
    const FoodItem(id:'a06',name:'Red Sauce Pasta',category:'Pizzas & Pastas',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=400&fit=crop',description:'Tangy tomato based penne pasta'),
    const FoodItem(id:'a07',name:'Mix Sauce Pasta',category:'Pizzas & Pastas',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=400&fit=crop',description:'Pink sauce pasta - best of both'),
    const FoodItem(id:'a08',name:'Mix Veg Burger',category:'Sandwiches & Burgers',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1585238342024-2296944d2e3a?w=400&fit=crop',description:'Crispy veg patty with fresh toppings'),
    const FoodItem(id:'a09',name:'Veg Burger',category:'Sandwiches & Burgers',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&fit=crop',description:'Classic veg burger with sauces'),
    const FoodItem(id:'a10',name:'Veg Hot Dog',category:'Sandwiches & Burgers',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1612392166886-d0367b26e78e?w=400&fit=crop',description:'Classic hot dog with mustard & ketchup'),
    const FoodItem(id:'a11',name:'Paneer Tikka Sandwich',category:'Sandwiches & Burgers',block:'A-Block',price:80,imageUrl:'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400&fit=crop',description:'Grilled paneer tikka stuffed sandwich'),
    const FoodItem(id:'a12',name:'Masala Kulcha Sandwich',category:'Sandwiches & Burgers',block:'A-Block',price:80,imageUrl:'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?w=400&fit=crop',description:'Spicy masala kulcha sandwich'),
    const FoodItem(id:'a13',name:'Chicken Sandwich',category:'Sandwiches & Burgers',block:'A-Block',price:90,imageUrl:'https://images.unsplash.com/photo-1550507992-eb63ffee0847?w=400&fit=crop',description:'Grilled chicken with mayo & lettuce',isVeg:false),
    const FoodItem(id:'a14',name:'Chicken Burger',category:'Sandwiches & Burgers',block:'A-Block',price:80,imageUrl:'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&fit=crop',description:'Juicy chicken patty burger',isVeg:false),
    const FoodItem(id:'a15',name:'Chicken Seekh Kabab',category:'Snacks & Sides',block:'A-Block',price:100,imageUrl:'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=400&fit=crop',description:'Smoky chicken seekh kabab',isVeg:false),
    const FoodItem(id:'a16',name:'Mutton Seekh Kabab',category:'Snacks & Sides',block:'A-Block',price:110,imageUrl:'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=400&fit=crop',description:'Juicy mutton seekh kabab',isVeg:false),
    const FoodItem(id:'a17',name:'French Fries',category:'Snacks & Sides',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400&fit=crop',description:'Golden crispy french fries'),
    const FoodItem(id:'a18',name:'Veg Subway',category:'Sandwiches & Burgers',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1509722747041-0a8e7e9b45b7?w=400&fit=crop',description:'Loaded veggie sub with cheese'),
    const FoodItem(id:'a19',name:'Paneer Subway',category:'Sandwiches & Burgers',block:'A-Block',price:80,imageUrl:'https://images.unsplash.com/photo-1509722747041-0a8e7e9b45b7?w=400&fit=crop',description:'Paneer tikka sub with sauces'),
    const FoodItem(id:'a20',name:'Chicken Subway',category:'Sandwiches & Burgers',block:'A-Block',price:90,imageUrl:'https://images.unsplash.com/photo-1509722747041-0a8e7e9b45b7?w=400&fit=crop',description:'Chicken teriyaki sub',isVeg:false),
    const FoodItem(id:'a21',name:'Plain Maggi',category:'Snacks & Sides',block:'A-Block',price:40,imageUrl:'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?w=400&fit=crop',description:'Classic 2-minute Maggi'),
    const FoodItem(id:'a22',name:'Veg Maggi',category:'Snacks & Sides',block:'A-Block',price:45,imageUrl:'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?w=400&fit=crop',description:'Maggi loaded with fresh veggies'),
    const FoodItem(id:'a23',name:'Bread Omelette',category:'Snacks & Sides',block:'A-Block',price:40,imageUrl:'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=400&fit=crop',description:'Fluffy omelette with bread toast',isVeg:false),
    const FoodItem(id:'a24',name:'Plain Omelette',category:'Snacks & Sides',block:'A-Block',price:30,imageUrl:'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=400&fit=crop',description:'Classic plain omelette',isVeg:false),
    const FoodItem(id:'a25',name:'Veg Pattie',category:'Rolls & Puffs',block:'A-Block',price:30,imageUrl:'https://images.unsplash.com/photo-1604908177453-7462950a6a3b?w=400&fit=crop',description:'Crispy puff pastry with veg filling'),
    const FoodItem(id:'a26',name:'Paneer Pattie',category:'Rolls & Puffs',block:'A-Block',price:40,imageUrl:'https://images.unsplash.com/photo-1587668178277-fb082b836fc5?w=400&fit=crop',description:'Flaky puff with paneer stuffing'),
    const FoodItem(id:'a27',name:'Chicken Pattie',category:'Rolls & Puffs',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1579208575657-c595a05383b7?w=400&fit=crop',description:'Crispy chicken puff',isVeg:false),
    const FoodItem(id:'a28',name:'Paneer Kathi Roll',category:'Rolls & Puffs',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=400&fit=crop',description:'Spicy paneer in flaky paratha wrap'),
    const FoodItem(id:'a29',name:'Veg Kathi Roll',category:'Rolls & Puffs',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=400&fit=crop',description:'Mixed veg wrapped in paratha'),
    const FoodItem(id:'a30',name:'Egg Roll',category:'Rolls & Puffs',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=400&fit=crop',description:'Egg omelette wrapped in paratha',isVeg:false),
    const FoodItem(id:'a31',name:'Chicken Seekh Roll',category:'Rolls & Puffs',block:'A-Block',price:100,imageUrl:'https://images.unsplash.com/photo-1600891964599-f94d5ac0c42e?w=400&fit=crop',description:'Smoky chicken seekh kebab roll',isVeg:false),
    const FoodItem(id:'a32',name:'Chocochip Muffin',category:'Desserts',block:'A-Block',price:40,imageUrl:'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=400&fit=crop',description:'Soft chocolate chip muffin'),
    const FoodItem(id:'a33',name:'Walnut Brownie',category:'Desserts',block:'A-Block',price:70,imageUrl:'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400&fit=crop',description:'Fudgy brownie with walnuts'),
    const FoodItem(id:'a34',name:'Fruit Chaat',category:'Desserts',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1564093497595-593b96d80180?w=400&fit=crop',description:'Fresh seasonal fruits with masala'),
    const FoodItem(id:'a35',name:'Cream Fruit Bowl',category:'Desserts',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=400&fit=crop',description:'Mixed fruits with fresh cream'),
    const FoodItem(id:'a36',name:'Badam Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&fit=crop',description:'Almond flavored milkshake'),
    const FoodItem(id:'a37',name:'Chocolate Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=400&fit=crop',description:'Rich chocolate milkshake'),
    const FoodItem(id:'a38',name:'Strawberry Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1579954354026-5d15c2e0b2a6?w=400&fit=crop',description:'Fresh strawberry milkshake'),
    const FoodItem(id:'a39',name:'Vanilla Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&fit=crop',description:'Classic vanilla milkshake'),
    const FoodItem(id:'a40',name:'Oreo Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1577805947697-89e18249d767?w=400&fit=crop',description:'Crushed Oreo cookie milkshake'),
    const FoodItem(id:'a41',name:'Butter Scotch Shake',category:'Milkshakes',block:'A-Block',price:60,imageUrl:'https://images.unsplash.com/photo-1541658016709-82535e94bc69?w=400&fit=crop',description:'Creamy butterscotch milkshake'),
    const FoodItem(id:'a42',name:'Hot Tea',category:'Beverages',block:'A-Block',price:15,imageUrl:'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400&fit=crop',description:'Classic masala chai'),
    const FoodItem(id:'a43',name:'Coffee',category:'Beverages',block:'A-Block',price:25,imageUrl:'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&fit=crop',description:'Hot brewed coffee'),
    const FoodItem(id:'a44',name:'Bournvita Milk',category:'Beverages',block:'A-Block',price:50,imageUrl:'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400&fit=crop',description:'Warm Bournvita milk'),
    const FoodItem(id:'a45',name:'Fresh Lemon Water',category:'Beverages',block:'A-Block',price:30,imageUrl:'https://images.unsplash.com/photo-1523371683773-affb93868490?w=400&fit=crop',description:'Refreshing nimbu pani'),
    const FoodItem(id:'a46',name:'Lemon Soda',category:'Beverages',block:'A-Block',price:40,imageUrl:'https://images.unsplash.com/photo-1523371683773-affb93868490?w=400&fit=crop',description:'Fizzy lemon soda'),

    // === C-BLOCK BASEMENT ===
    const FoodItem(id:'cb01',name:'Veg Thali',category:'North Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1546833999-b38d3e7a1c44?w=400&fit=crop',description:'Dal, sabzi, roti & rice - full meal'),
    const FoodItem(id:'cb02',name:'Choley Kulche',category:'North Indian',block:'C-Block Basement',price:40,imageUrl:'https://images.unsplash.com/photo-1626132647523-66f5bf380027?w=400&fit=crop',description:'Spicy chana with soft kulcha'),
    const FoodItem(id:'cb03',name:'Choley Bhature',category:'North Indian',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1606491956689-2ea866880049?w=400&fit=crop',description:'Fluffy bhature with spicy choley'),
    const FoodItem(id:'cb04',name:'Poori Bhaaji',category:'North Indian',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=400&fit=crop',description:'Golden pooris with aloo bhaaji'),
    const FoodItem(id:'cb05',name:'Choley Poori',category:'North Indian',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=400&fit=crop',description:'Crispy poori with choley'),
    const FoodItem(id:'cb06',name:'Pav Bhaji',category:'North Indian',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1606491956689-2ea866880049?w=400&fit=crop',description:'Mumbai style pav bhaji'),
    const FoodItem(id:'cb07',name:'Masala Dosa',category:'South Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&fit=crop',description:'Crispy dosa with potato masala'),
    const FoodItem(id:'cb08',name:'Onion Dosa',category:'South Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1589301760435-e64f54d178e1?w=400&fit=crop',description:'Crispy dosa with onion filling'),
    const FoodItem(id:'cb09',name:'Paneer Dosa',category:'South Indian',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=400&fit=crop',description:'Dosa stuffed with paneer masala'),
    const FoodItem(id:'cb10',name:'Mix Dosa',category:'South Indian',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1630383249896-424e482df921?w=400&fit=crop',description:'Dosa with mixed veg filling'),
    const FoodItem(id:'cb11',name:'Mix Veg Uttapam',category:'South Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1567337710282-00832b415979?w=400&fit=crop',description:'Thick pancake with veggies'),
    const FoodItem(id:'cb12',name:'Tomato Uttapam',category:'South Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1567337710282-00832b415979?w=400&fit=crop',description:'Tomato topped uttapam'),
    const FoodItem(id:'cb13',name:'Vada Sambhar',category:'South Indian',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1589301760435-e64f54d178e1?w=400&fit=crop',description:'Crispy vada with hot sambhar'),
    const FoodItem(id:'cb14',name:'Lemon Rice with Sambhar',category:'South Indian',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&fit=crop',description:'Tangy lemon rice with sambhar'),
    const FoodItem(id:'cb15',name:'Aloo Paratha',category:'Parathas',block:'C-Block Basement',price:30,imageUrl:'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400&fit=crop',description:'Stuffed aloo paratha with butter'),
    const FoodItem(id:'cb16',name:'Aloo Matar Paratha',category:'Parathas',block:'C-Block Basement',price:40,imageUrl:'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400&fit=crop',description:'Potato & peas stuffed paratha'),
    const FoodItem(id:'cb17',name:'Paneer Paratha',category:'Parathas',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1613564834361-9bc5b30ede30?w=400&fit=crop',description:'Rich paneer stuffed paratha'),
    const FoodItem(id:'cb18',name:'Egg Paratha',category:'Parathas',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=400&fit=crop',description:'Egg stuffed crispy paratha',isVeg:false),
    const FoodItem(id:'cb19',name:'Veg Noodles',category:'Chinese & Rice',block:'C-Block Basement',price:40,imageUrl:'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&fit=crop',description:'Stir fried veg hakka noodles'),
    const FoodItem(id:'cb20',name:'Egg Noodles',category:'Chinese & Rice',block:'C-Block Basement',price:90,imageUrl:'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=400&fit=crop',description:'Egg fried noodles',isVeg:false),
    const FoodItem(id:'cb21',name:'Paneer Noodles',category:'Chinese & Rice',block:'C-Block Basement',price:100,imageUrl:'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&fit=crop',description:'Paneer hakka noodles'),
    const FoodItem(id:'cb22',name:'Chicken Noodles',category:'Chinese & Rice',block:'C-Block Basement',price:120,imageUrl:'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=400&fit=crop',description:'Chicken hakka noodles',isVeg:false),
    const FoodItem(id:'cb23',name:'Fried Rice',category:'Chinese & Rice',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&fit=crop',description:'Classic veg fried rice'),
    const FoodItem(id:'cb24',name:'Fried Rice with Manchurian',category:'Chinese & Rice',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400&fit=crop',description:'Fried rice with manchurian gravy'),
    const FoodItem(id:'cb25',name:'Egg Fried Rice',category:'Chinese & Rice',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400&fit=crop',description:'Egg fried rice',isVeg:false),
    const FoodItem(id:'cb26',name:'Chicken Fried Rice',category:'Chinese & Rice',block:'C-Block Basement',price:150,imageUrl:'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400&fit=crop',description:'Chicken fried rice',isVeg:false),
    const FoodItem(id:'cb27',name:'Chilli Potato',category:'Chinese & Rice',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1626200419199-391ae4be7a34?w=400&fit=crop',description:'Crispy potato in spicy sauce'),
    const FoodItem(id:'cb28',name:'Honey Chilli Potato',category:'Chinese & Rice',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1626200419199-391ae4be7a34?w=400&fit=crop',description:'Sweet & spicy crispy potato'),
    const FoodItem(id:'cb29',name:'Chilli Paneer',category:'Chinese & Rice',block:'C-Block Basement',price:70,imageUrl:'https://images.unsplash.com/photo-1567188040759-fb8a883dc6d8?w=400&fit=crop',description:'Indo-Chinese chilli paneer dry'),
    const FoodItem(id:'cb30',name:'Chilli Chicken',category:'Chinese & Rice',block:'C-Block Basement',price:120,imageUrl:'https://images.unsplash.com/photo-1525755497512-ad59c4f97506?w=400&fit=crop',description:'Spicy dry chilli chicken (6 pcs)',isVeg:false),
    const FoodItem(id:'cb31',name:'Veg Momos',category:'Momos',block:'C-Block Basement',price:50,imageUrl:'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=400&fit=crop',description:'Steamed veg momos with chutney'),
    const FoodItem(id:'cb32',name:'Paneer Momos',category:'Momos',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1609501676725-7186f017a7a7?w=400&fit=crop',description:'Paneer stuffed steamed momos'),
    const FoodItem(id:'cb33',name:'Chicken Momos',category:'Momos',block:'C-Block Basement',price:60,imageUrl:'https://images.unsplash.com/photo-1625220194771-7ebdea0b70b9?w=400&fit=crop',description:'Juicy chicken momos',isVeg:false),
    const FoodItem(id:'cb34',name:'Samosa',category:'Snacks & Quick Bites',block:'C-Block Basement',price:15,imageUrl:'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=400&fit=crop',description:'Crispy samosa with potato filling'),
    const FoodItem(id:'cb35',name:'Samosa Choley',category:'Snacks & Quick Bites',block:'C-Block Basement',price:30,imageUrl:'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=400&fit=crop',description:'Samosa topped with spicy choley'),
    const FoodItem(id:'cb36',name:'Veg Patties',category:'Snacks & Quick Bites',block:'C-Block Basement',price:15,imageUrl:'https://images.unsplash.com/photo-1604908177453-7462950a6a3b?w=400&fit=crop',description:'Crispy veg puff pastry'),
    const FoodItem(id:'cb37',name:'Paneer Patties',category:'Snacks & Quick Bites',block:'C-Block Basement',price:20,imageUrl:'https://images.unsplash.com/photo-1604908177453-7462950a6a3b?w=400&fit=crop',description:'Flaky puff with paneer filling'),
    const FoodItem(id:'cb38',name:'Bread Omelette',category:'Snacks & Quick Bites',block:'C-Block Basement',price:40,imageUrl:'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=400&fit=crop',description:'Fluffy omelette with bread',isVeg:false),
    const FoodItem(id:'cb39',name:'Bread Pakora',category:'Snacks & Quick Bites',block:'C-Block Basement',price:15,imageUrl:'https://images.unsplash.com/photo-1604908177453-7462950a6a3b?w=400&fit=crop',description:'Crispy fried bread pakora'),
    const FoodItem(id:'cb40',name:'Maggi',category:'Snacks & Quick Bites',block:'C-Block Basement',price:30,imageUrl:'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?w=400&fit=crop',description:'Classic Maggi noodles'),

  ];

  static List<FoodItem> itemsForBlock(String block) => allItems.where((i) => i.block == block).toList();
  static List<FoodItem> itemsForBlockAndCategory(String block, String cat) => allItems.where((i) => i.block == block && i.category == cat).toList();
}
