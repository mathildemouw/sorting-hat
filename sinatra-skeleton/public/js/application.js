$(document).ready(function() {

  var movieList = {};
  $('#userMovieInput').submit(function() {
    event.preventDefault();
    var imdbTitle =  $('#movieTitle').val();
    $.ajax({
      type: 'GET',
      url: "http://www.omdbapi.com/?i=&t=" + imdbTitle,
      }).done(function(data) {
        var genres = data.match(/\"Genre\":\"(.*)\",\"Director\"/)[1]
        genres = genres.split(", ");
        movieList[imdbTitle] = genres;
      }).fail(function(){console.log("Your request was bad and you should feel bad!")})
    })

  $('#sortByMovies').submit(function(event) {
    movieList
  })
});