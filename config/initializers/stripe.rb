Rails.configuration.stripe = {
  :publishable_key => "pk_GXMNIykMS4y6ZjIniH6zvkGhFWurE",
  :secret_key      => "YDmKiBndMWO05lSFm310BNLbcgXjkk92"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]