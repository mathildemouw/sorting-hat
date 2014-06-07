$(document).ready(function() {

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
        genres = genres.split(", ");
        movieList[imdbTitle] = genres;
        console.log(movieList)
      }).fail(function(){console.log("you failed")})
    })


  $('#sortByMovies').submit(function(event) {
    movieList
  })
});