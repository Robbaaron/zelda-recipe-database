# Zelda Recipe Database

A normalized SQL database project inspired by *The Legend of Zelda: Breath of the Wild*, modeling recipes, ingredients, and cooking mechanics from the game.

## 📋 Overview

This project builds a relational schema to represent recipe data in a game-inspired universe. It is fully normalized to Third Normal Form (3NF) and designed for meaningful queries like finding recipes by ingredient, calculating value, and analyzing recipe efficiency.

## 🗂️ Schema

The schema includes the following tables:

- `recipes`: Basic recipe info and economic data
- `ingredients`: Includes type, dye color, hearts recovered, and pricing
- `recipe_ingredients`: Many-to-many join table with quantities
- `cooking_methods`, `dyes`, `types`: Lookup tables for normalization

[📄 View the full SQL schema](./zelda_schema.sql)

## 🧭 Entity Relationship Diagram

This diagram outlines the structure of the Zelda Recipe Database, including primary keys, foreign keys, and relationships between tables.

![Zelda Schema ERD](./assets/zelda_erd.png)

## 🛠️ Tech Used

- SQL (PostgreSQL / MySQL compatible)
- DataGrip (for design and testing)
- ER Diagram 
- CSV sample data

## 📊 Sample Queries

Explore sample SQL queries used to answer gameplay-inspired questions, such as:

- Top 10 most expensive recipes
- Budget-friendly meals
- Recipes using specific dye colors or ingredients
- Highest heart-recovery meals

[📂 View sample SQL queries](./queries/zelda_queries.sql)

## 🎤 Project Presentation

View the final slide deck used to present this project, highlighting database design, normalization process, and sample queries.

[📽️ View Presentation Slides (PDF)](./presentation/zelda_presentation.pdf)




