Template.overlay.helpers
  overlayShowing: -> 'showing' if Session.get 'booking-court'
  bookingOptions: -> ['Singles', 'Doubles', 'Lessons']

Template.overlay.events
  'click a.cancel': -> Session.set 'booking-court', null
  'click a.book': ->
    court = Courts.findOne Session.get 'booking-court'
    return if court.booking
    Courts.update court._id,
      $set: booking: String @
    Session.set 'booking-court', null