if(document.getElementById("tags")){
  var availableTags = ["flatstack", "rails", "ruby"]

  $.ajax({
    url: "/tags",
    type: "get",
    contentType: "application/json",
    dataType: "json",

    success: function (result) {
      for(var i = 0; i < result.length; i++)
        availableTags[i] = result[i]
    }
  });

  $(document).ready(function () {
    $("#tags").tagit({
      fieldName: "article[tags]",
      singleField: true,
      availableTags: availableTags,
      allowDuplicates: false,
      placeholderText: "Tags"
    });
  });
};
