var availableTags = []

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
    fieldName: "article[all_tags]",
    singleField: true,
    availableTags: availableTags,
    allowDuplicates: false,
    placeholderText: "Tags"
  });
});
