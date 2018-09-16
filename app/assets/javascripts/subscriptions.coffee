# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  subscription.setupForm()

subscription =
  setupForm: ->
    $('#new_subscription').submit (e) ->
      e.preventDefault()
      $('input[type="submit"]').attr('disabled', 'disabled')
      subscription.processCard()

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()

    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
    Stripe.card.createToken(card, subscription.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#subscription_stripe_card_token').val(response.id)
      $('#new_subscription')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type="submit"]').removeAttr('disabled')
