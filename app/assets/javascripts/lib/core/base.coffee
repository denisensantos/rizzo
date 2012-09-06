define( ['jquery','lib/core/ad_manager','lib/utils/asset_fetch', 'lib/core/authenticator','lib/core/shopping_cart'], ($, AdManager, AssetFetch, Authenticator, ShoppingCart) ->

  class Base

    constructor: ->
      @userNav()
      @userBasket()
      @adLeaderboard()

    adConfig: ->
      adZone : window.lp.ads.adZone or 'home'
      adKeywords : window.lp.ads.adKeywords or ' '
      tile : lp.ads.tile or ' '
      segQS : lp.ads.segQS or ' '
      mtfIFPath : (lp.ads.mtfIFPath or '/')
      unit: [728,90]
      
    userNav: ->
      lpLoggedInUsername = null
      auth = new Authenticator()
      AssetFetch.get "https://secure.lonelyplanet.com/sign-in/status", () ->
        auth.update()

    adLeaderboard: ->
      if window.lp and window.lp.ads 
        AdManager.init(@adConfig(),'ad_leaderboard')

    userBasket: ->
      shopCart = new ShoppingCart()

)
