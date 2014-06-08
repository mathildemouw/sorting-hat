var movieList = {}; // {"Fargo": ["Crime", "Comedy"], "The Lion King": ["Drama", "Comedy"] }
$(document).ready(function() {
  setupAddMovie();
  setupGetSorted();
});

function appendTitle(title) {
  $('.movie-list').append("<li>" + title + "</li>")
}

function setupAddMovie() {
  $('#userMovieInput').submit(function(e) {
    e.preventDefault();
    var imdbTitle =  $('#movieTitle').val();
    appendTitle(imdbTitle);
    $('#movieTitle').val('')
    $.ajax({
      type: 'GET',
      url: "http://www.omdbapi.com/?i=&t=" + imdbTitle,
      }).done(function(data) {
        var genres = data.match(/\"Genre\":\"(.*)\",\"Director\"/)[1]
        genres = genres.split(", ");
        movieList[imdbTitle] = genres;
      }).fail(function(){console.log("Your request was bad and you should feel bad!")})
    })
  }

function setupGetSorted(){
  $('.sort').on("click", function(e) {
    e.preventDefault()
    $.ajax({
      type: "POST",
      url: "/house",
      data: movieList,
    }).done(function(data){
      houses = ["Gryffindor", "Slytherin", "Hufflepuff", "Ravenclaw"]
      for( var i = 0; i < houses.length; i++){
        var parsedData = jQuery.parseJSON(data);
        showHouse(houses[i].toLowerCase(), (50* parseInt(parsedData[houses[i]])));
      }
    })
  })
}

function showHouse ( house, newHeight ) {
  newWidth = newHeight * 0.80;
  $('#'+house ).animate( {height: newHeight, width: newWidth}, 1500 );
}