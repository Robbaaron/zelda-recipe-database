-- 🔝 Query 1: Top 10 most expensive recipes by total ingredient cost
SELECT 
    r.name AS recipe,
    r.caption AS description,
    SUM(i.buy_price * ri.quantity) AS total_cost
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
GROUP BY r.recipe_id, r.name, r.caption
ORDER BY total_cost DESC
LIMIT 10;

-- 💰 Query 2: Budget-friendly recipes costing 50 rupees or less
SELECT 
    r.name,
    SUM(i.buy_price * ri.quantity) AS total_cost
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
GROUP BY r.name
HAVING total_cost <= 50;

-- 🎨 Query 3: Recipes that include ingredients with dye color "Peach"
SELECT DISTINCT 
    r.name AS recipe,
    r.caption AS description
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
JOIN dyes d ON i.dye_id = d.dye_id
WHERE d.color = 'Peach'
LIMIT 5;

-- 🧀 Query 4: Recipes that include the ingredient "Hateno Cheese"
SELECT 
    r.name AS recipe,
    r.caption AS description
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.name = 'Hateno Cheese';

-- 📦 Query 5: Most frequently used ingredients across all recipes
SELECT 
    i.name,
    COUNT(ri.recipe_id) AS recipe_count
FROM ingredients i
JOIN recipe_ingredients ri ON i.ingredient_id = ri.ingredient_id
GROUP BY i.ingredient_id, i.name
ORDER BY recipe_count DESC
LIMIT 10;

-- ❤️ Query 6: Recipes with the highest total hearts recovered
SELECT 
    r.name,
    SUM(i.hearts_recovered * ri.quantity) AS total_hearts_recovered
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
GROUP BY r.name
ORDER BY total_hearts_recovered DESC
LIMIT 10;

-- 🍓 Query 7: Average cost of recipes using ingredients of type 'Fruit'
SELECT 
    ROUND(AVG(recipe_cost)) AS avg_cost_fruit_recipes
FROM (
    SELECT 
        r.recipe_id, 
        SUM(i.buy_price * ri.quantity) AS recipe_cost
    FROM recipes r
    JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
    JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
    JOIN types t ON i.type_id = t.type_id
    WHERE t.type = 'Fruit'
    GROUP BY r.recipe_id
) AS fruit_recipes;

-- 🥩 Query 8: Recipes made from only one type of ingredient
SELECT 
    r.name AS recipe,
    r.caption AS description
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
JOIN types t ON i.type_id = t.type_id
GROUP BY r.name, r.caption
HAVING COUNT(DISTINCT t.type_id) = 1;

-- 🌿 Query 9: Recipes using ingredients with the dye color "Green"
SELECT DISTINCT  
    r.name,
    r.caption AS description
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
JOIN dyes d ON i.dye_id = d.dye_id
WHERE d.color = 'Green';

-- ❄️ Query 10: Recipes that use "Freezing" as their cooking method
SELECT 
    r.name AS recipe_name,
    r.caption AS description,
    cm.cooking_method
FROM recipes r
JOIN cooking_methods cm ON r.cooking_id = cm.cooking_id
WHERE cm.cooking_method = 'Freezing';
