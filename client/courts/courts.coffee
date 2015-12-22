Session.setDefault 'booking-court', null

columns = 3

Template.courts.helpers
  allCourts: ->
    all = Courts.find().fetch()
    result = []
    while all.length
      row = []
      while all.length and row.length < columns
        row.push all.shift()
      result.push row
    result

  isBooked: -> 'booked' if @booking


Template.courts.events
  'click td': (e) ->
    court = Courts.findOne @_id
    return if court?.booking
    Session.set 'booking-court', @_id

