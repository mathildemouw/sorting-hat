$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // IMDb ID to Search
  var movieList = {};
  $('#userMovieInput').submit(function() {
    event.preventDefault();
    var imdbTitle =  $('#movieTitle').val();
    $.ajax({
      type: 'GET',
      url: "http://www.omdbapi.com/?i=&t=" + imdbTitle,
      }).done(function(data) {
        console.log(data)
        var genres = data.match(/\"Genre\":\"(.*)\",\"Director\"/)[1]
        // debugger
        genres = genres.split(", ");
        movieList[imdbTitle] = genres;
        console.log(movieList)
      }).fail(function(){console.log("you failed")})
    })

    //OMDB request
    // var imdbTitle = event.movies;



  $('#sortByMovies').submit(function(event) {
    movieList
  })

  // Send Request
  // var http = new ActiveXObject("Microsoft.XMLHTTP");

  // http.open("GET", "http://www.omdbapi.com/?i=&t=" + imdbTitle, false);
  // http.send(null);

  // // Response to JSON
  // var omdbData = http.responseText;
  // var omdbJSON = eval("(" + omdbData + ")");

  // // Returns Movie Title
  // alert(omdbJSON.Title);
  // console.log(omdbJSON.Genre)

});