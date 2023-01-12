using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Driver;

var hostname = "localhost";
var port = 27017;
var databaseName = "liveDemo";
var connectionString = $"mongodb://{hostname}:{port}";

var client = new MongoClient(connectionString);
var database = client.GetDatabase(databaseName);

var collection = database.GetCollection<Person>(
    "people",
    new MongoCollectionSettings()
    {
        AssignIdOnInsert = true
    });

//var Thilde = new Person()
//{
//    Age = 6, 
//    FirstName = "Thilde", 
//    Lastname = "Hjelm"
//};

//collection.InsertOne(Thilde);

var person = collection.Find(p=>p.FirstName.Equals("Niklas")).ToList();

//foreach (var person in people)
//{
//    Console.WriteLine(person.FirstName);
//}

var filter = Builders<Person>.Filter.Eq("FirstName", "Niklas");
var update = Builders<Person>.Update.Set("Age", 36);

collection.FindOneAndUpdate(filter, update);

person = collection.Find(p => p.FirstName.Equals("Niklas")).ToList();

Console.WriteLine(person);



record Person
{
    [BsonId]
    public ObjectId Id { get; set; }

    [BsonElement] public string FirstName { get; set; } = string.Empty;

    [BsonElement] public string Lastname { get; set; } = string.Empty;

    [BsonElement]
    public int Age { get; set; }

}