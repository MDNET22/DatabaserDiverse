// See https://aka.ms/new-console-template for more information
using MusicLabb2.Models;

Console.WriteLine("Hello, World!");


//using (var context = new MusicLabb2Context())
//{
//    var tracks = context.Tracks.ToList();
//}

//using (var context = new MusicLabb2Context())
//{
//    var track = new Track
//    {
//        Name = "My New Track",
//        AlbumId = 1,
//        MediaTypeId = 1,
//        GenreId = 1,
//        Composer = "John Smith",
//        Milliseconds = 30000,
//        Bytes = 45000,
//        UnitPrice = 1.29m
//    };
//    context.Tracks.Add(track);
//    context.SaveChanges();
//}

//using (var context = new MusicLabb2Context())
//{
//    var track = context.Tracks.FirstOrDefault(t => t.TrackId == 1);
//    track.Name = "Updated Track Name";
//    context.Tracks.Update(track);
//    context.SaveChanges();
//}

//using (var context = new MusicLabb2Context())
//{
//    var track = context.Tracks.FirstOrDefault(t => t.TrackId == 1);
//    context.Tracks.Remove(track);
//    context.SaveChanges();
//}

//using (var context = new MusicLabb2Context())
//{
//    var tracks = context.Tracks.Select(t => new Track
//    {
//        Id = t.TrackId,
//        Name = t.Name,
//        Composer = t.Composer
//    }).ToList();

//    foreach (var track in tracks)
//    {
//        Console.WriteLine($"{track.Id} - {track.Name} by {track.Composer}");
//    }
//}

while (true)
{
    Console.WriteLine("Enter a command (create, delete, modify, or quit):");
    var command = Console.ReadLine();

    if (command == "quit")
    {
        break;
    }

    if (command == "create")
    {
        Console.WriteLine("Enter the name of the playlist:");
        var name = Console.ReadLine();

        using (var context = new MusicLabb2Context())
        {
            var playlist = new Playlist
            {
                Name = name
            };
            context.Playlists.Add(playlist);
            context.SaveChanges();
        }
    }
    using (var context = new MusicLabb2Context())
    {
        Console.WriteLine("Enter the ID of the playlist to delete:");
        var id = int.Parse(Console.ReadLine());

        var playlist = context.Playlists.Find(id);
        context.Playlists.Remove(playlist);
        context.SaveChanges();
    }
    using (var context = new MusicLabb2Context())
    {
        Console.WriteLine("Enter the ID of the playlist to modify:");
        var id = int.Parse(Console.ReadLine());

        var playlist = context.Playlists.Find(id);
        Console.WriteLine("Enter the new name of the playlist:");
        playlist.Name = Console.ReadLine();
        context.Playlists.Update(playlist);
        context.SaveChanges();
    }
}