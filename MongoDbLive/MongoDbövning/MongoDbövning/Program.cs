using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using MongoDB.Driver;
using System;

var hostname = "localhost";
var port = 27017;
var databaseName = "liveDemoRep";
var connectionString = $"mongodb://{hostname}:{port}";

var client = new MongoClient(connectionString);
var database = client.GetDatabase(databaseName);

var collection = database.GetCollection<Car>(
    "Vehicles",
    new MongoCollectionSettings()
    {
        AssignIdOnInsert = true
    });

//var Volvo = new Car()
//{
//    Brand = "Volvo",
//    Model = "XC90",
//    FuelType = "Petrol"
//};

//var BMW = new Car()
//{
//    Brand = "BMW",
//    Model = "XC90",
//    FuelType = "Diesel"
//};

//var WW = new Car()
//{
//    Brand = "WW",
//    Model = "Golf",
//    FuelType = "Petrol"
//};

//var Tesla = new Car()
//{
//    Brand = "Tesla",
//    Model = "Model 3",
//    FuelType = "Electric"
//};

//collection.InsertOne(Volvo);
//collection.InsertOne(BMW);
//collection.InsertOne(WW);
//collection.InsertOne(Tesla);

var car = collection.Find(c => c.Model.Equals("Niklas")).ToList();

Console.WriteLine(car);

class Car
{
    [BsonId]
    public ObjectId Id { get; set; }

    [BsonElement] public string Brand { get; set; } = string.Empty;

    [BsonElement] public string Model { get; set; } = string.Empty;

    [BsonElement] public string FuelType { get; set; } = string.Empty;

    //[BsonElement]
    //public int Age { get; set; }
}