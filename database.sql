 
 CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(255) ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 

 CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL UNIQUE
 );


 CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  image TEXT,
  old_price DECIMAL(10,2),
  new_price DECIMAL(10,2),
  rating DECIMAL(3,2),
  discount INT,
  category_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE product_colors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  color_name VARCHAR(50),
  color_code VARCHAR(20),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_highlights (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  highlight_text VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_images (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  image_url VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_sizes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  size VARCHAR(10),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_reviews (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  user_name VARCHAR(100),
  rating INT,
  review_text TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_ratings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  rating_value FLOAT,
  rating_count INT,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE product_offers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  offer_text VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);



---------------------------------------------
 FOREIGN KEY KYA HOTA HAI?
---------------------------------------------
Foreign Key ek column hota hai jo kisi dusre table ke PRIMARY KEY se link hota hai.
Iska use data ko sahi tarike se relate karne ke liye hota hai.

Example:
product_id foreign key hai -> products table ke id se link hota hai.
Iska matlab ye hua ki:
“Ye colors/images/sizes/reviews kis product ke belong karte hain.”

---------------------------------------------
 FOREIGN KEY KYU USE HOTE HAIN?
---------------------------------------------
✔ Data clean aur managed rehta hai  
✔ Invalid data enter nahi ho sakta  
✔ Real project me relations create hote hain  
✔ "Ek product ke saare colors / images / reviews" properly linked rehte hain  
✔ Database searching fast aur safe hoti hai  

Without foreign key:
- Tum galti se product_id me koi bhi number dal doge jo exist hi nahi karta.
With foreign key:
- Sirf wahi product_id allowed hota hai jo products table me exist karta ho.

---------------------------------------------
 ON DELETE CASCADE KYA HAI?
---------------------------------------------
Agar parent table ka data delete ho jaye, to automatically 
child table ka linked data bhi delete ho jaye.

Example:
Agar products table me product delete kiya:
 DELETE FROM products WHERE id = 10;

To ON DELETE CASCADE ke wajah se:
- product_colors (10 ka color)
- product_images (10 ka image)
- product_sizes (10 ki sizes)
- product_reviews (10 ki reviews)
- product_offers (10 ke offers)
sab automatic delete ho jayenge.

---------------------------------------------
 YE REAL PROJECT ME KYU USE HOTA HAI?
---------------------------------------------
✔ Garbage data bach jata hai  
✔ Orphan records nahi bante  
✔ Database clean rehta hai  
✔ Developer ko manually saare related rows delete nahi karni padti  
✔ Performance aur consistency better hoti hai  

Isliye professional projects me ON DELETE CASCADE bohot common hai.


