-- Zelda Recipe Database Schema

-- Cooking Methods Table
CREATE TABLE cooking_methods (
    cooking_id INT AUTO_INCREMENT PRIMARY KEY,
    cooking_method VARCHAR(255) NOT NULL
);

-- Dyes Table
CREATE TABLE dyes (
    dye_id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(255) NOT NULL
);

-- Types Table
CREATE TABLE types (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL
);

-- Ingredients Table
CREATE TABLE ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    caption VARCHAR(255) NOT NULL,
    type_id INT NOT NULL,
    hearts_recovered FLOAT NOT NULL,
    sell_price INT NOT NULL,
    buy_price INT NOT NULL,
    dye_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES types(type_id),
    FOREIGN KEY (dye_id) REFERENCES dyes(dye_id)
);

-- Recipes Table
CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    caption VARCHAR(255) NOT NULL,
    cooking_id INT NOT NULL,
    sell_price INT NOT NULL,
    buy_price INT NOT NULL,
    FOREIGN KEY (cooking_id) REFERENCES cooking_methods(cooking_id)
);

-- Recipe_Ingredients Table
CREATE TABLE recipe_ingredients (
    recipe_ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);
