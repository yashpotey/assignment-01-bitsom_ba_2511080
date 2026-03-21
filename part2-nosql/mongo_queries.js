// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "ELEC001",
    name: "Smartphone X12",
    category: "Electronics",
    price: 45000,
    brand: "TechMax",
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      battery: "5000mAh",
      storage: "128GB"
    },
    features: ["5G", "Dual SIM", "Fast Charging"],
    ratings: { average: 4.5, reviews_count: 1200 }
  },
  {
    product_id: "CLOT001",
    name: "Men's Denim Jacket",
    category: "Clothing",
    price: 3500,
    brand: "UrbanStyle",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Denim",
    color_options: ["Blue", "Black"],
    ratings: { average: 4.2, reviews_count: 350 }
  },
  {
    product_id: "GROC001",
    name: "Organic Milk 1L",
    category: "Groceries",
    price: 60,
    expiry_date: "2024-12-20",
    nutritional_info: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    storage_instructions: "Keep refrigerated"
  }
]);

// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: "ELEC001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// Explanation:
// Indexing the 'category' field improves query performance
// for frequent searches like filtering Electronics or Groceries.
