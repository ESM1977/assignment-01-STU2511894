// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "ELEC1001",
    name: "Sony 55-inch 4K Ultra HD Smart TV",
    category: "Electronics",
    brand: "Sony",
    price: 64999,
    currency: "INR",
    stock: 18,
    warranty: {
      period_months: 24,
      type: "Manufacturer Warranty"
    },
    specifications: {
      screen_size_inches: 55,
      resolution: "3840x2160",
      display_type: "LED",
      smart_tv: true,
      voltage: "220-240V",
      connectivity: ["WiFi", "Bluetooth", "HDMI", "USB"]
    },
    ratings: {
      average: 4.5,
      reviews_count: 312
    },
    seller: {
      seller_id: "SELLER501",
      seller_name: "ElectroWorld"
    }
  },
  {
    _id: "CLOT2001",
    name: "Men's Slim Fit Casual Shirt",
    category: "Clothing",
    brand: "Allen Solly",
    price: 1499,
    currency: "INR",
    stock: 60,
    sizes_available: ["S", "M", "L", "XL"],
    colors_available: ["Blue", "White", "Black"],
    material: {
      fabric: "Cotton",
      blend_percentage: "100% Cotton"
    },
    care_instructions: [
      "Machine wash cold",
      "Do not bleach",
      "Iron at low temperature"
    ],
    fit_details: {
      fit_type: "Slim Fit",
      sleeve_type: "Full Sleeve",
      pattern: "Solid"
    },
    ratings: {
      average: 4.2,
      reviews_count: 185
    },
    seller: {
      seller_id: "SELLER622",
      seller_name: "FashionHub"
    }
  },
  {
    _id: "GROC3001",
    name: "Organic Whole Wheat Bread",
    category: "Groceries",
    brand: "NatureFresh",
    price: 55,
    currency: "INR",
    stock: 120,
    expiry_date: new Date("2026-03-28"),
    manufacturing_date: new Date("2026-03-18"),
    weight: {
      value: 400,
      unit: "gms"
    },
    nutritional_info: {
      serving_size: "100gms",
      calories: 247,
      protein_g: 9.8,
      carbohydrates_g: 41.2,
      fat_g: 3.4,
      fiber_g: 6.5
    },
    ingredients: [
      "Whole wheat flour",
      "Water",
      "Yeast",
      "Salt",
      "Natural preservatives"
    ],
    storage_instructions: {
      temperature: "Store in a cool and dry place",
      refrigeration_required: false
    },
    seller: {
      seller_id: "SELLER733",
      seller_name: "DailyGrocer"
    }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "ELEC1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });


