====== Steam ======

Some doc links

steampowered api link 

https://wiki.teamfortress.com/wiki/User:RJackson/StorefrontAPI

Steamworks api docs

https://partner.steamgames.com/doc/webapi/ISteamApps

--


https://api.steampowered.com/ISteamApps/GetAppList/v0002/?format=json

<code json app_list_sample.json>
{
  "applist": {
    "apps": [{
        "appid": 2061600,
        "name": "Chuhou Joutai 3: Three Nights of Scarlet Abscess Demo"
      },
      {
        "appid": 2061610,
        "name": "Rogue Company - Scarlet Contract Starter Pack"
      }
     ]
  }
}
</code>

===== App details (by id) =====

https://store.steampowered.com/api/appdetails?appids=296710

<code json appdetails.json>
{
  "296710": {
    "success": true,
    "data": {
      "type": "game",
      "name": "Monstrum",
      "steam_appid": 296710,
      "required_age": 0,
      "is_free": false,
      "controller_support": "full",
      "dlc": [
        385870
      ],
      "detailed_description": "<strong>Monstrum takes the traditional survival horror formula and remixes it completely with procedurally generated levels, permadeath, and AI driven predators, ensuring that nowhere on its derelict cargo ship is ever truly safe. </strong><br><br>Offering up a challenge to even the hardiest of gamers, Monstrum will force you to use your wits and whatever tools you can find to outrun or outsmart your pursuer. Attempt to escape from an environment that is out to kill you while evading the lurking terror that could be around any corner. Can you survive Monstrum? <br><br><strong>Game Features</strong><br><br><u>Three Unique Monsters</u><br><br>Face one of three monster types each play-through, each one with different behaviours and tactics. Can you work your way out of an ambush or escape a direct attack? And will the same actions work every time?<br><br><u>Procedural Arena </u><br><br>Prepare for a different gameplay environment each time you play as the ship's interior shifts shape with every run, changing the location of items along the way. <br><br><u>Escape Routes</u><br><br>Discover different methods of escape and delve into the bowels of the ship to recover items you need to repair them. <br><br><u>Opportunities and Hazards</u><br><br>Use whatever you can find to try and outwit the monster. Hide in lockers or under furniture. Use distractions to attract the monster to you, or, perhaps more wisely, to where you've just been, but be careful not to run too fast lest you fall into one of the ships numerous traps along the way. <br><br><u>Permadeath</u><br><br>Death is permanent. Get killed in Monstrum and you'll be starting again. In a different ship, probably against a different monster. Good luck. Start running.",
      "about_the_game": "<strong>Monstrum takes the traditional survival horror formula and remixes it completely with procedurally generated levels, permadeath, and AI driven predators, ensuring that nowhere on its derelict cargo ship is ever truly safe. </strong><br><br>Offering up a challenge to even the hardiest of gamers, Monstrum will force you to use your wits and whatever tools you can find to outrun or outsmart your pursuer. Attempt to escape from an environment that is out to kill you while evading the lurking terror that could be around any corner. Can you survive Monstrum? <br><br><strong>Game Features</strong><br><br><u>Three Unique Monsters</u><br><br>Face one of three monster types each play-through, each one with different behaviours and tactics. Can you work your way out of an ambush or escape a direct attack? And will the same actions work every time?<br><br><u>Procedural Arena </u><br><br>Prepare for a different gameplay environment each time you play as the ship's interior shifts shape with every run, changing the location of items along the way. <br><br><u>Escape Routes</u><br><br>Discover different methods of escape and delve into the bowels of the ship to recover items you need to repair them. <br><br><u>Opportunities and Hazards</u><br><br>Use whatever you can find to try and outwit the monster. Hide in lockers or under furniture. Use distractions to attract the monster to you, or, perhaps more wisely, to where you've just been, but be careful not to run too fast lest you fall into one of the ships numerous traps along the way. <br><br><u>Permadeath</u><br><br>Death is permanent. Get killed in Monstrum and you'll be starting again. In a different ship, probably against a different monster. Good luck. Start running.",
      "short_description": "Monstrum takes the traditional survival horror formula and remixes it completely with procedurally generated levels, permadeath, and AI driven predators, ensuring that nowhere on its derelict cargo ship is ever truly safe.",
      "supported_languages": "English<strong>*</strong><br><strong>*</strong>languages with full audio support",
      "header_image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/header.jpg?t=1726015695",
      "capsule_image": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/capsule_231x87.jpg?t=1726015695",
      "capsule_imagev5": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/capsule_184x69.jpg?t=1726015695",
      "website": "http://teamjunkfish.com/games/monstrum",
      "pc_requirements": {
        "minimum": "<strong>Minimum:</strong><br><ul class=\"bb_ul\"><li><strong>OS *:</strong> Windows 7 - 32 bit<br></li><li><strong>Processor:</strong> Intel / AMD - 2.4 GHz (Dual Core)<br></li><li><strong>Memory:</strong> 4 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 285 / ATI Radeon HD 4870 X2 - 1GB (Direct x 9.0c / 10 / 11)<br></li><li><strong>DirectX:</strong> Version 9.0c<br></li><li><strong>Storage:</strong> 3 GB available space<br></li><li><strong>VR Support:</strong> Oculus PC. Keyboard or gamepad required<br></li><li><strong>Additional Notes:</strong> Oculus Rift requires minimum standards described here: </li></ul>",
        "recommended": "<strong>Recommended:</strong><br><ul class=\"bb_ul\"><li><strong>OS *:</strong> Windows 7 / 8 - 64 bit<br></li><li><strong>Processor:</strong> Intel Core i5 / AMD FX-6 - 3.0+ GHz (Quad Core)<br></li><li><strong>Memory:</strong> 8 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 560 Ti / AMD Radeon HD 6970 - 1GB (Direct x 11)<br></li><li><strong>DirectX:</strong> Version 11<br></li><li><strong>Storage:</strong> 3 GB available space</li></ul>"
      },
      "mac_requirements": {
        "minimum": "<strong>Minimum:</strong><br><ul class=\"bb_ul\"><li><strong>OS:</strong> OSX 10.8.5 (Mountain Lion)<br></li><li><strong>Processor:</strong> Intel / AMD - 2.4 GHz (Dual Core)<br></li><li><strong>Memory:</strong> 4 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 285 / ATI Radeon HD 4870 X2 - 1GB (Direct x 9.0c / 10 / 11)<br></li><li><strong>Storage:</strong> 3 GB available space<br></li><li><strong>Additional Notes:</strong> Oculus Rift requires windows OS &amp; other minimum standards described here: </li></ul>",
        "recommended": "<strong>Recommended:</strong><br><ul class=\"bb_ul\"><li><strong>OS:</strong> OSX 10.9.5 (Mavericks)<br></li><li><strong>Processor:</strong> Intel Core i5 / AMD FX-6 - 3.0+ GHz (Quad Core)<br></li><li><strong>Memory:</strong> 8 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 560 Ti / AMD Radeon HD 6970 - 1GB (Direct x 11)<br></li><li><strong>Storage:</strong> 3 GB available space</li></ul>"
      },
      "linux_requirements": {
        "minimum": "<strong>Minimum:</strong><br><ul class=\"bb_ul\"><li><strong>OS:</strong> Mint 17.1 (Rebecca) / Ubuntu 14.04 (Trusty Tahr)<br></li><li><strong>Processor:</strong> Intel / AMD - 2.4 GHz (Dual Core)<br></li><li><strong>Memory:</strong> 4 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 285 / ATI Radeon HD 4870 X2 - 1GB (Direct x 9.0c / 10 / 11)<br></li><li><strong>Storage:</strong> 3 GB available space<br></li><li><strong>Additional Notes:</strong> Oculus Rift requires windowsOS &amp; other minimum standards described here: </li></ul>",
        "recommended": "<strong>Recommended:</strong><br><ul class=\"bb_ul\"><li><strong>OS:</strong> Mint 17.1 (Rebecca) / Ubuntu 14.04 (Trusty Tahr)<br></li><li><strong>Processor:</strong> Intel Core i5 / AMD FX-6 - 3.0+ GHz (Quad Core)<br></li><li><strong>Memory:</strong> 8 GB RAM<br></li><li><strong>Graphics:</strong> Nvidia GTX 560 Ti / AMD Radeon HD 6970 - 1GB (Direct x 11)<br></li><li><strong>Storage:</strong> 3 GB available space</li></ul>"
      },
      "legal_notice": "Monstrum™ is a trademark and/or registered trademark of Junkfish Limited. In the UK and/or foreign countries. All other marks and trademarks are properties of their respective owners.",
      "developers": [
        "Team Junkfish"
      ],
      "publishers": [
        "Junkfish Limited"
      ],
      "price_overview": {
        "currency": "EUR",
        "initial": 1499,
        "final": 299,
        "discount_percent": 80,
        "initial_formatted": "14,99€",
        "final_formatted": "2,99€"
      },
      "packages": [
        42828
      ],
      "package_groups": [
        {
          "name": "default",
          "title": "Buy Monstrum",
          "description": "",
          "selection_text": "Select a purchase option",
          "save_text": "",
          "display_type": 0,
          "is_recurring_subscription": "false",
          "subs": [
            {
              "packageid": 42828,
              "percent_savings_text": "-80% ",
              "percent_savings": 0,
              "option_text": "Monstrum - <span class=\"discount_original_price\">14,99€</span> 2,99€",
              "option_description": "",
              "can_get_free_license": "0",
              "is_free_license": false,
              "price_in_cents_with_discount": 299
            }
          ]
        }
      ],
      "platforms": {
        "windows": true,
        "mac": true,
        "linux": true
      },
      "categories": [
        {
          "id": 2,
          "description": "Single-player"
        },
        {
          "id": 22,
          "description": "Steam Achievements"
        },
        {
          "id": 28,
          "description": "Full controller support"
        },
        {
          "id": 53,
          "description": "VR Supported"
        },
        {
          "id": 31,
          "description": "VR Support"
        },
        {
          "id": 43,
          "description": "Remote Play on TV"
        },
        {
          "id": 62,
          "description": "Family Sharing"
        }
      ],
      "genres": [
        {
          "id": "23",
          "description": "Indie"
        }
      ],
      "screenshots": [
        {
          "id": 0,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_52b64b32d34c5dde2297558a6f1b2fd00347a501.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_52b64b32d34c5dde2297558a6f1b2fd00347a501.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 1,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_48ac409771e440917de9ef1ac9cff3c6035f3758.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_48ac409771e440917de9ef1ac9cff3c6035f3758.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 2,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_cfe8f9f69862e6868e062d440a37b1acdc8dfc34.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_cfe8f9f69862e6868e062d440a37b1acdc8dfc34.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 3,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_b20ef40d99ed0eaaf30306b6c742603788706b92.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_b20ef40d99ed0eaaf30306b6c742603788706b92.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 4,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_3237260cb321c3650c82c1d5d3cf321d65334793.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_3237260cb321c3650c82c1d5d3cf321d65334793.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 5,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_ef4836d1d8715142361699b4c1dcd252b7b7c8a4.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_ef4836d1d8715142361699b4c1dcd252b7b7c8a4.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 6,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_75a42f85ab14190f9507cc2278e8e8add3a09702.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_75a42f85ab14190f9507cc2278e8e8add3a09702.1920x1080.jpg?t=1726015695"
        },
        {
          "id": 7,
          "path_thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_60496b6ed93c0e16f76bc2a7fe694a57a186cef5.600x338.jpg?t=1726015695",
          "path_full": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/296710/ss_60496b6ed93c0e16f76bc2a7fe694a57a186cef5.1920x1080.jpg?t=1726015695"
        }
      ],
      "movies": [
        {
          "id": 2039358,
          "name": "Monstrum - Launch Trailer",
          "thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2039358/movie.293x165.jpg?t=1447374816",
          "webm": {
            "480": "http://video.akamai.steamstatic.com/store_trailers/2039358/movie480.webm?t=1447374816",
            "max": "http://video.akamai.steamstatic.com/store_trailers/2039358/movie_max.webm?t=1447374816"
          },
          "mp4": {
            "480": "http://video.akamai.steamstatic.com/store_trailers/2039358/movie480.mp4?t=1447374816",
            "max": "http://video.akamai.steamstatic.com/store_trailers/2039358/movie_max.mp4?t=1447374816"
          },
          "highlight": true
        },
        {
          "id": 2036783,
          "name": "Monstrum - Early Access Trailer",
          "thumbnail": "https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2036783/movie.293x165.jpg?t=1447368037",
          "webm": {
            "480": "http://video.akamai.steamstatic.com/store_trailers/2036783/movie480.webm?t=1447368037",
            "max": "http://video.akamai.steamstatic.com/store_trailers/2036783/movie_max.webm?t=1447368037"
          },
          "mp4": {
            "480": "http://video.akamai.steamstatic.com/store_trailers/2036783/movie480.mp4?t=1447368037",
            "max": "http://video.akamai.steamstatic.com/store_trailers/2036783/movie_max.mp4?t=1447368037"
          },
          "highlight": true
        }
      ],
      "recommendations": {
        "total": 2816
      },
      "achievements": {
        "total": 16,
        "highlighted": [
          {
            "name": "Got To It",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/56ca4b172f7c2f1057a2d246a33b01c102289e6f.jpg"
          },
          {
            "name": "Women and Children First",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/9b27daa21dd7ab355a10e86274fe197b239942c4.jpg"
          },
          {
            "name": "The Hunt for Me is Over",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/1519bf72fc041505b0dd0f051062139d9181c7b3.jpg"
          },
          {
            "name": "Well Done",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/22d86d8ec19c925a768461e26a78898b4226a579.jpg"
          },
          {
            "name": "The Most Dangerous Game",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/fb9610067510e0ce716202d36e6881e9f464c8dc.jpg"
          },
          {
            "name": "Fiendzoned",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/2841cc019d1486de9b89993d3a9165814e290a8d.jpg"
          },
          {
            "name": "Aim Away From Face",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/f17ae560b0b733710c74a31cb8f68227b911d24d.jpg"
          },
          {
            "name": "Bait 'N' Switch",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/f7e867c2c75a31b1940642eaca14febf5f13f3b1.jpg"
          },
          {
            "name": "Steam Won't Connect",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/5d57d4a4d8742ef6f087ba8ce1f36419cb77888d.jpg"
          },
          {
            "name": "I Don't Know What I Expected",
            "path": "https://cdn.akamai.steamstatic.com/steamcommunity/public/images/apps/296710/ee2f4611059e29e497aa3822c03a6d56bbbccd66.jpg"
          }
        ]
      },
      "release_date": {
        "coming_soon": false,
        "date": "20 May, 2015"
      },
      "support_info": {
        "url": "https://www.teamjunkfish.com/contact",
        "email": "support@teamjunkfish.co.uk"
      },
      "background": "https://store.akamai.steamstatic.com/images/storepagebackground/app/296710?t=1726015695",
      "background_raw": "https://store.akamai.steamstatic.com/images/storepagebackground/app/296710?t=1726015695",
      "content_descriptors": {
        "ids": [
          5
        ],
        "notes": "Experience the horror of being hunted by a monster, while you try to survive and escape."
      },
      "ratings": {
        "esrb": {
          "rating": "m",
          "descriptors": "Violence\r\nBlood\r\nStrong Language"
        },
        "dejus": {
          "rating_generated": "1",
          "rating": "10",
          "required_age": "10",
          "banned": "0",
          "use_age_gate": "0",
          "descriptors": "Medo"
        },
        "steam_germany": {
          "rating_generated": "1",
          "rating": "12",
          "required_age": "12",
          "banned": "0",
          "use_age_gate": "0",
          "descriptors": "Gewalt"
        }
      }
    }
  }
}
</code>
===== Price for many ids :TO-DO: =====

https://store.steampowered.com/api/appdetails?appids=296710,45978,1942280&filters=price_overview


====== Nintendo ======

[[https://gist.github.com/GabrielMMelo/b88f3d4d68a8883f17f1c3300e58a23f|Switch eshop links]]

Node library to crawl the eshop

[[https://github.com/favna/nintendo-switch-eshop/blob/main/src/lib/utils/constants.ts|nintendo-switch-eshop]]


===== Overview search response =====

[[https://searching.nintendo-europe.com/de/select?q=stardew%20valley&fq=type%3A*%20AND%20sorting_title%3A*%20AND%20*%3A*&sort=score%20desc%2C%20date_from%20desc&start=0&rows=24&wt=json&bf=linear(ms(priority%2CNOW%2FHOUR)%2C3.19e-11%2C0)&bq=!deprioritise_b%3Atrue%5E999&group=true&group.field=pg_s&group.limit=3&group.sort=score%20desc,%20date_from%20desc&json.wrf=nindo.net.jsonp.jsonpCallback_825_8999999761581|searching.nintendo-europe.com/de/select]]

Query params 

<code txt query_params>
q: stardew valley
fq: type:* AND sorting_title:* AND *:*
sort: score desc, date_from desc
start: 0
rows: 24
wt: json
bf: linear(ms(priority,NOW/HOUR),3.19e-11,0)
bq: !deprioritise_b:true^999
group: true
group.field: pg_s
group.limit: 3
group.sort: score desc, date_from desc
json.wrf: nindo.net.jsonp.jsonpCallback_825_8999999761581
</code>

<code javascript response.js>
nindo.net.jsonp.jsonpCallback_825_8999999761581({
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "bf":"linear(ms(priority,NOW/HOUR),3.19e-11,0)",
      "group.limit":"3",
      "start":"0",
      "fq":"type:* AND sorting_title:* AND *:*",
      "sort":"score desc, date_from desc",
      "rows":"24",
      "bq":"!deprioritise_b:true^999",
      "q":"stardew valley",
      "json.wrf":"nindo.net.jsonp.jsonpCallback_825_8999999761581",
      "group.sort":"score desc, date_from desc",
      "wt":"json",
      "group.field":"pg_s",
      "group":"true"}},
  "grouped":{
    "pg_s":{
      "matches":62,
      "groups":[{
          "groupValue":"GAME",
          "doclist":{"numFound":27,"start":0,"numFoundExact":true,"docs":[
              {
                "fs_id":"2557083",
                "change_date":"2024-08-27T14:04:16Z",
                "url":"/de-de/Spiele/Nintendo-Switch-Download-Software/Valley-Peaks-2557083.html",
                "type":"GAME",
                "dates_released_dts":["2025-12-31T00:00:00Z"],
                "club_nintendo":false,
                "pretty_date_s":"2025",
                "play_mode_tv_mode_b":true,
                "indie_b":true,
                "play_mode_handheld_mode_b":true,
                "image_url_sq_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/1x1_NSwitchDS_ValleyPeaks_image500w.jpg",
                "deprioritise_b":false,
                "demo_availability":false,
                "pg_s":"GAME",
                "originally_for_t":"HAC",
                "paid_subscription_required_b":false,
                "priority":"2035-12-31T22:59:59Z",
                "digital_version_b":true,
                "title_extras_txt":["Valley Peaks"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_ValleyPeaks_image500w.jpg",
                "system_type":["nintendoswitch_downloadsoftware"],
                "age_rating_sorting_i":0,
                "game_categories_txt":["adventure",
                  "platformer",
                  "puzzle"],
                "play_mode_tabletop_mode_b":true,
                "publisher":"Those Awesome Guys",
                "excerpt":"Die Berge rufen",
                "date_from":"2025-12-31T00:00:00Z",
                "language_availability":["chinese, english"],
                "product_catalog_description_s":"Die Berge rufen",
                "price_discount_percentage_f":0.0,
                "title":"Valley Peaks",
                "sorting_title":"Valley Peaks",
                "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/1x1_NSwitchDS_ValleyPeaks_square_image_wishlist.jpg",
                "players_to":1,
                "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_ValleyPeaks_banner_image_wishlist_640w.jpg",
                "paid_subscription_online_play_b":false,
                "playable_on_txt":["HAC"],
                "hits_i":300,
                "pretty_game_categories_txt":["Adventure",
                  "Platformer",
                  "Puzzle"],
                "title_master_s":"Valley Peaks",
                "switch_game_voucher_b":false,
                "game_category":["adventure,puzzle,platformer"],
                "system_names_txt":["Nintendo Switch"],
                "pretty_agerating_s":"USK ab 0 Jahren",
                "eshop_removed_b":false,
                "age_rating_type":"usk",
                "price_sorting_f":999999.0,
                "price_lowest_f":-1.0,
                "age_rating_value":"0",
                "physical_version_b":false,
                "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_ValleyPeaks_banner_image_wishlist_460w.jpg",
                "_version_":1824858929555832847},
              {
                "fs_id":"2719040",
                "change_date":"2025-01-02T10:36:02Z",
                "url":"/de-de/Spiele/Nintendo-Switch-Download-Software/Fishing-Valley-2719040.html",
                "type":"GAME",
                "dates_released_dts":["2024-12-26T00:00:00Z"],
                "club_nintendo":false,
                "pretty_date_s":"26.12.2024",
                "play_mode_tv_mode_b":true,
                "play_mode_handheld_mode_b":true,
                "product_code_txt":["HACPBJEPA"],
                "image_url_sq_s":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/1x1_FishingValley_image500w.jpg",
                "deprioritise_b":false,
                "demo_availability":false,
                "pg_s":"GAME",
                "add_on_content_b":true,
                "compatible_controller":["nintendoswitch_pro_controller"],
                "originally_for_t":"HAC",
                "paid_subscription_required_b":false,
                "cloud_saves_b":true,
                "priority":"2034-12-25T23:00:00Z",
                "digital_version_b":true,
                "title_extras_txt":["Fishing Valley"],
                "price_discounted_f":2.99,
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/2x1_FishingValley_image500w.jpg",
                "system_type":["nintendoswitch_downloadsoftware"],
                "age_rating_sorting_i":0,
                "game_categories_txt":["adventure",
                  "platformer",
                  "simulation",
                  "sports"],
                "play_mode_tabletop_mode_b":true,
                "publisher":"Pancake Games",
                "product_code_ss":["HACPBJEPA"],
                "excerpt":"Tauche ein in ein geschichtenbasiertes Angelabenteuer!",
                "nsuid_txt":["70010000083949"],
                "date_from":"2024-12-26T00:00:00Z",
                "dlc_shown_b":true,
                "language_availability":["english, spanish, french, german"],
                "price_has_discount_b":true,
                "product_catalog_description_s":"Tauche ein in ein geschichtenbasiertes Angelabenteuer!",
                "related_nsuids_txt":["70010000083949"],
                "price_discount_percentage_f":63.0,
                "title":"Fishing Valley",
                "sorting_title":"Fishing Valley",
                "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/1x1_FishingValley_square_image_wishlist.jpg",
                "players_to":1,
                "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/2x1_FishingValley_banner_image_wishlist_640w.jpg",
                "paid_subscription_online_play_b":false,
                "playable_on_txt":["HAC"],
                "hits_i":300,
                "pretty_game_categories_txt":["Adventure",
                  "Platformer",
                  "Simulation",
                  "Sport"],
                "title_master_s":"Fishing Valley",
                "switch_game_voucher_b":false,
                "game_category":["platformer,adventure,simulation,sports"],
                "system_names_txt":["Nintendo Switch"],
                "pretty_agerating_s":"USK ab 0 Jahren",
                "price_regular_f":7.99,
                "eshop_removed_b":false,
                "age_rating_type":"usk",
                "price_sorting_f":2.99,
                "price_lowest_f":2.99,
                "age_rating_value":"0",
                "physical_version_b":false,
                "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/2x1_FishingValley_banner_image_wishlist_460w.jpg",
                "downloads_rank_i":17199,
                "_version_":1824858933523644433},
              {
                "fs_id":"1287587",
                "change_date":"2022-09-19T15:17:24Z",
                "url":"/de-de/Spiele/Nintendo-Switch-Download-Software/Stardew-Valley-1287587.html",
                "type":"GAME",
                "dates_released_dts":["2017-10-05T00:00:00Z"],
                "club_nintendo":false,
                "pretty_date_s":"05.10.2017",
                "play_mode_tv_mode_b":true,
                "play_mode_handheld_mode_b":true,
                "product_code_txt":["HACPACPGA"],
                "image_url_sq_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_StardewValley_image500w.jpg",
                "deprioritise_b":false,
                "demo_availability":false,
                "pg_s":"GAME",
                "compatible_controller":["nintendoswitch_pro_controller"],
                "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_StardewValley_image500w.jpg",
                "originally_for_t":"HAC",
                "paid_subscription_required_b":true,
                "cloud_saves_b":true,
                "priority":"2027-10-04T22:00:00Z",
                "digital_version_b":true,
                "title_extras_txt":["Stardew Valley"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_StardewValley_deDE_image500w.jpg",
                "system_type":["nintendoswitch_downloadsoftware"],
                "age_rating_sorting_i":6,
                "game_categories_txt":["rpg",
                  "simulation"],
                "play_mode_tabletop_mode_b":true,
                "publisher":"ConcernedApe",
                "product_code_ss":["HACPACPGA"],
                "excerpt":"Du hast den Bauernhof deines Großvaters geerbt. Ausgerüstet mit abgenutztem Werkzeug und ein paar Münzen, brichst du auf, um ein neues Leben zu beginnen.",
                "nsuid_txt":["70010000001802"],
                "date_from":"2017-10-05T00:00:00Z",
                "language_availability":["japanese, english, spanish, french, german, italian, portuguese, russian, korean, chinese"],
                "price_has_discount_b":false,
                "product_catalog_description_s":"Du hast den Bauernhof deines Großvaters geerbt. Ausgerüstet mit abgenutztem Werkzeug und ein paar Münzen, brichst du auf, um ein neues Leben zu beginnen.",
                "related_nsuids_txt":["70010000001802"],
                "price_discount_percentage_f":0.0,
                "title":"Stardew Valley",
                "sorting_title":"Stardew Valley",
                "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_StardewValley_square_image_wishlist.jpg",
                "players_to":4,
                "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_StardewValley_deDE_banner_image_wishlist_640w.jpg",
                "paid_subscription_online_play_b":true,
                "off_tv_play_b":false,
                "voice_chat_b":true,
                "playable_on_txt":["HAC"],
                "hits_i":300,
                "pretty_game_categories_txt":["RPG",
                  "Simulation"],
                "title_master_s":"Stardew Valley",
                "switch_game_voucher_b":false,
                "game_category":["simulation,rpg"],
                "system_names_txt":["Nintendo Switch"],
                "pretty_agerating_s":"USK ab 6 Jahren",
                "price_regular_f":13.99,
                "eshop_removed_b":false,
                "players_from":1,
                "age_rating_type":"usk",
                "price_sorting_f":13.99,
                "price_lowest_f":13.99,
                "age_rating_value":"6",
                "physical_version_b":false,
                "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_StardewValley_deDE_banner_image_wishlist_460w.jpg",
                "downloads_rank_i":46,
                "_version_":1824858929503404065}]
          }},
        {
          "groupValue":"NEWS",
          "doclist":{"numFound":6,"start":0,"numFoundExact":true,"docs":[
              {
                "fs_id":"2313521",
                "change_date":"2022-12-12T14:04:18Z",
                "url":"/de-de/News/2022/Dezember/Entspanne-dich-mit-diesen-Wohlfuhl-Spielen-fur-Nintendo-Switch-2313521.html",
                "type":"NEWS",
                "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/news_10/2022_5/december_42/1x1_NSwitch_CosyGamesNews_12122022_DE_image500w.jpg",
                "pretty_date_s":"12.12.2022",
                "title":"Entspanne dich mit diesen Wohlfühl-Spielen für Nintendo Switch",
                "sorting_title":"Entspanne dich mit diesen Wohlfühl-Spielen für Nintendo Switch",
                "feed_date_s":"2022-12-12T15:00:00Z",
                "system_codes_txt":["HAC"],
                "date_rfc822_s":"Mon, 12 Dec 2022 15:00:00 +0100",
                "system_type":["nintendoswitch_gamecard"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/news_9/2022_4/december_43/2x1_NSwitch_CosyGamesNews_12122022_DE_image500w.jpg",
                "topic":"download_games",
                "deprioritise_b":false,
                "excerpt":"Schnapp dir eine Decke und mach es dir mit diesen Nintendo Switch-Spielen gemütlich!",
                "hits_i":300,
                "pg_s":"NEWS",
                "date_from":"2022-12-12T00:00:00Z",
                "news_date":"2022-12-12T00:00:00Z",
                "_version_":1824858933503721472},
              {
                "fs_id":"2752518",
                "change_date":"2025-02-11T13:05:25Z",
                "url":"/de-de/News/2025/Februar/Lokale-Koop-Spiele-auf-Nintendo-Switch-2752518.html",
                "type":"NEWS",
                "image_url":"https://www.nintendo.com/eu/media/images/news_12/2025/february_27/local_co_op_games_on_nintendo_switch/1x1_NSwitch_Coopgames2025_DE_de_image500w.jpg",
                "pretty_date_s":"11.02.2025",
                "title":"Lokale Koop-Spiele auf Nintendo Switch",
                "sorting_title":"Lokale Koop-Spiele auf Nintendo Switch",
                "feed_date_s":"2025-02-11T14:00:00Z",
                "system_codes_txt":["HAC"],
                "date_rfc822_s":"Tue, 11 Feb 2025 14:00:00 +0100",
                "system_type":["nintendoswitch_gamecard"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/news_12/2025/february_27/local_co_op_games_on_nintendo_switch/2x1_NSwitch_Coopgames2025_DE_de_image500w.jpg",
                "topic":"download_games",
                "deprioritise_b":false,
                "excerpt":"Mach es dir auf der Couch gemütlich mit diesen Nintendo Switch-Spielen, die kooperativen Mehrspieler-Modus bieten!",
                "hits_i":300,
                "pg_s":"NEWS",
                "date_from":"2025-02-11T00:00:00Z",
                "news_date":"2025-02-11T00:00:00Z",
                "_version_":1824858929506549811},
              {
                "fs_id":"1208692",
                "change_date":"2022-01-17T10:59:28Z",
                "url":"/de-de/News/2017/Marz/Jede-Menge-Spass-wartet-im-Nintendo-eShop-fur-Nintendo-Switch--1208692.html",
                "type":"NEWS",
                "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/systems_12/nintendo_switch/SQ_NintendoSwitchLogo_image500w.png",
                "pretty_date_s":"22.03.2017",
                "title":"Jede Menge Spaß wartet im Nintendo eShop für Nintendo Switch!",
                "sorting_title":"Jede Menge Spaß wartet im Nintendo eShop für Nintendo Switch!",
                "feed_date_s":"2017-03-22T10:00:00Z",
                "system_codes_txt":["HAC"],
                "date_rfc822_s":"Wed, 22 Mar 2017 10:00:00 +0100",
                "system_type":["nintendoswitch_gamecard"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/systems_11/nintendo_switch_1/H2x1_NSwitch_Keyvisual_image500w.jpg",
                "topic":"feature_news",
                "deprioritise_b":false,
                "excerpt":"Großartige Spiele aller Art sind im Nintendo eShop erhältlich!",
                "hits_i":300,
                "pg_s":"NEWS",
                "date_from":"2017-03-22T00:00:00Z",
                "news_date":"2017-03-22T00:00:00Z",
                "_version_":1824859046601031712}]
          }},
        {
          "groupValue":"SUPPORT",
          "doclist":{"numFound":1,"start":0,"numFoundExact":true,"docs":[
              {
                "fs_id":"1658052",
                "change_date":"2022-09-12T08:49:01Z",
                "url":"/de-de/Support/Nintendo-Switch/Welche-Nintendo-Switch-Spiele-unterstutzen-Voice-Chat-1658052.html",
                "type":"SUPPORT",
                "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/support_10/SQ_NSwitch_support_A_image500w.jpg",
                "title":"Welche Nintendo Switch-Spiele unterstützen Voice-Chat?",
                "sorting_title":"Welche Nintendo Switch-Spiele unterstützen Voice-Chat?",
                "system_type":["Nintendo Switch"],
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/support_9/H2x1_NSwitch_support_no_logo_image500w.jpg",
                "oracle_answer_id_en_gb_s":"47090",
                "deprioritise_b":false,
                "excerpt":"Viele beliebte Spiele unterstützen Voice-Chat über die Nintendo Switch Online-App , darunter: ARMS DRAGON QUEST BUILDERS 2 Mario Kart 8 Deluxe Mario Tennis Aces MARVEL ULTIMATE ALLIANCE 3: The Black Order Mortal Kombat 11 Red Faction",
                "hits_i":300,
                "pg_s":"SUPPORT",
                "_version_":1824858933500575776}]
          }},
        {
          "groupValue":"DLC",
          "doclist":{"numFound":26,"start":0,"numFoundExact":true,"docs":[
              {
                "fs_id":"2755056",
                "change_date":"2025-02-12T01:13:15Z",
                "url":"/de-de/DLC/Fishing-Valley-Fresh-Delivery-2755056.html",
                "type":"DLC",
                "dates_released_dts":["2025-02-11T00:00:00Z"],
                "price_has_discount_b":false,
                "pretty_date_s":"11.02.2025",
                "related_nsuids_txt":["70050000055241"],
                "price_discount_percentage_f":0.0,
                "title":"Fishing Valley - Fresh Delivery",
                "sorting_title":"Fishing Valley - Fresh Delivery",
                "related_game_id_s":"2719040",
                "pretty_dlc_type_s":"DLC",
                "deprioritise_b":false,
                "hits_i":300,
                "pg_s":"DLC",
                "title_master_s":"Fishing Valley - Fresh Delivery",
                "required_system_txt":["Nintendo Switch"],
                "image_url":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/1x1_FishingValley_image500w.jpg",
                "price_regular_f":0.0,
                "originally_for_t":"HAC",
                "title_extras_txt":["Fishing Valley - Fresh Delivery",
                  "Fishing Valley"],
                "dlc_type_s":"dlc",
                "price_sorting_f":0.0,
                "price_lowest_f":0.0,
                "publisher":"Pancake Games",
                "related_game_title_s":"Fishing Valley",
                "excerpt":"Fresh Delivery: Kostenlose Dekorationen, um deine Aquarien zum Strahlen zu bringen!",
                "nsuid_txt":["70050000055241"],
                "date_from":"2025-02-11T00:00:00Z",
                "downloads_rank_i":999999,
                "_version_":1824858998121168929},
              {
                "fs_id":"2755060",
                "change_date":"2025-02-12T01:13:16Z",
                "url":"/de-de/DLC/Fishing-Valley-Pixelize-It--2755060.html",
                "type":"DLC",
                "dates_released_dts":["2025-02-11T00:00:00Z"],
                "price_has_discount_b":false,
                "pretty_date_s":"11.02.2025",
                "related_nsuids_txt":["70050000055243"],
                "price_discount_percentage_f":0.0,
                "title":"Fishing Valley - Pixelize It!",
                "sorting_title":"Fishing Valley - Pixelize It!",
                "related_game_id_s":"2719040",
                "pretty_dlc_type_s":"DLC",
                "deprioritise_b":false,
                "hits_i":300,
                "pg_s":"DLC",
                "title_master_s":"Fishing Valley - Pixelize It!",
                "required_system_txt":["Nintendo Switch"],
                "image_url":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/1x1_FishingValley_image500w.jpg",
                "price_regular_f":0.0,
                "originally_for_t":"HAC",
                "title_extras_txt":["Fishing Valley - Pixelize It!",
                  "Fishing Valley"],
                "dlc_type_s":"dlc",
                "price_sorting_f":0.0,
                "price_lowest_f":0.0,
                "publisher":"Pancake Games",
                "related_game_title_s":"Fishing Valley",
                "excerpt":"Bringe retro Charme nach Fishing Valley mit Pixelize It! – dein pixelperfektes Upgrade!",
                "nsuid_txt":["70050000055243"],
                "date_from":"2025-02-11T00:00:00Z",
                "downloads_rank_i":999999,
                "_version_":1824859025428185171},
              {
                "fs_id":"2755064",
                "change_date":"2025-02-12T01:13:17Z",
                "url":"/de-de/DLC/Fishing-Valley-Angler-s-Style-Pack-2755064.html",
                "type":"DLC",
                "dates_released_dts":["2025-02-11T00:00:00Z"],
                "price_has_discount_b":false,
                "pretty_date_s":"11.02.2025",
                "related_nsuids_txt":["70050000055242"],
                "price_discount_percentage_f":0.0,
                "title":"Fishing Valley - Angler’s Style Pack",
                "sorting_title":"Fishing Valley - Angler’s Style Pack",
                "related_game_id_s":"2719040",
                "pretty_dlc_type_s":"DLC",
                "deprioritise_b":false,
                "hits_i":300,
                "pg_s":"DLC",
                "title_master_s":"Fishing Valley - Angler’s Style Pack",
                "required_system_txt":["Nintendo Switch"],
                "image_url":"https://www.nintendo.com/eu/media/images/assets/nintendo_switch_games/fishingvalley/1x1_FishingValley_image500w.jpg",
                "price_regular_f":0.0,
                "originally_for_t":"HAC",
                "title_extras_txt":["Fishing Valley - Angler’s Style Pack",
                  "Fishing Valley"],
                "dlc_type_s":"dlc",
                "price_sorting_f":0.0,
                "price_lowest_f":0.0,
                "publisher":"Pancake Games",
                "related_game_title_s":"Fishing Valley",
                "excerpt":"Fische mit Stil mit dem Angler’s Style Pack – neue Looks für deine Abenteuer!",
                "nsuid_txt":["70050000055242"],
                "date_from":"2025-02-11T00:00:00Z",
                "downloads_rank_i":999999,
                "_version_":1824859036916383782}]
          }},
        {
          "groupValue":"OTHER",
          "doclist":{"numFound":2,"start":0,"numFoundExact":true,"docs":[
              {
                "fs_id":"937171",
                "change_date":"2022-01-15T20:23:29Z",
                "url":"/de-de/Kampagnen/Super-Smash-Bros-Club-Nintendo-Aktion/Soundtrack-CD/Soundtrack-CD-937171.html",
                "type":"STANDARD",
                "ms7_b":true,
                "ms7leftnavi_b":true,
                "image_url":"https://www.nintendo.com/eu/media/images/03_teaser_module_1_square/other_3/campaigns_1/TM_Promo_CrossCF_v01_image500w.jpg",
                "title":"Soundtrack CD",
                "sorting_title":"Soundtrack CD",
                "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/others_3/campaigns_3/SI_Promo_CrossCF_v01_image500w.png",
                "deprioritise_b":false,
                "excerpt":"Die Doppel-CD \"Super Smash Bros. for Nintendo 3DS & Wii U: Premium Sound Selection\" enthält 72 Musikstücke aus beiden Versionen des Spiels.",
                "hits_i":300,
                "pg_s":"OTHER",
                "_version_":1824858989447348248},
              {
                "fs_id":"1049368",
                "change_date":"2022-01-15T20:32:55Z",
                "url":"/de-de/Iwata-fragt/Iwata-fragt-Nintendo-DSi/Teil-7-Die-Produktion-von-Flipnote-Studio/1-Eine-andere-Firma-aus-Kyoto/1-Eine-andere-Firma-aus-Kyoto-1049368.html",
                "type":"INTERVIEW",
                "interview_title_s":"Iwata fragt: Nintendo DSi",
                "image_url":"https://www.nintendo.com/eu/media/images/03_teaser_module_1_square/systems_2/nintendo_ds_3/TM_GenericTMs_NDS_image500w.png",
                "deprioritise_b":false,
                "title":"1. Eine andere Firma aus Kyoto",
                "sorting_title":"1. Eine andere Firma aus Kyoto",
                "excerpt":"Satoru Iwata's Interviews über die vielen neuen Features des Nintendo DSi.",
                "hits_i":300,
                "pg_s":"OTHER",
                "_version_":1824859067903901773}]
          }}]}}})

</code>

===== Price details :TO-DO: =====

https://api.ec.nintendo.com/v1/price?country=JP&ids=70010000009922&lang=jp

<code json game_price.json>
{
  "personalized": false,
  "country": "JP",
  "prices": [
    {
      "title_id": 70010000009922,
      "sales_status": "onsale",
      "regular_price": {
        "amount": "1,620円",
        "currency": "JPY",
        "raw_value": "1620"
      },
      "discount_price": {
        "amount": "1,069円",
        "currency": "JPY",
        "raw_value": "1069",
        "start_datetime": "2025-02-13T15:00:00Z",
        "end_datetime": "2025-03-11T14:59:59Z"
      },
      "gold_point": {
        "basic_gift_gp": "54",
        "basic_gift_rate": "0.05",
        "consume_gp": "0",
        "extra_gold_points": [],
        "gift_gp": "54",
        "gift_rate": "0.05"
      }
    }
  ]
}
</code>


