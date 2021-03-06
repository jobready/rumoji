# -*- encoding: utf-8 -*-

require 'rumoji/emoji'
require 'set'

module Rumoji
  class Emoji
    NATURE = SortedSet[
      self.new("☀" , [:sunny], "BLACK SUN WITH RAYS"),
      self.new("☔" , [:umbrella], "UMBRELLA WITH RAIN DROPS"),
      self.new("☁" , [:cloud]),
      self.new("❄" , [:snowflake]),
      self.new("⛄" , [:snowman, :snowman_without_snow], "SNOWMAN WITHOUT SNOW"),
      self.new("⚡" , [:zap], "HIGH VOLTAGE SIGN"),
      self.new("🌀", [:cyclone]), # "typhoon, hurricane
      self.new("🌁", [:foggy]),
      self.new("🌊", [:ocean], "WATER WAVE"),
      self.new("🌤", [:sun_behind_small_cloud, :mostly_sunny], "WHITE SUN WITH SMALL CLOUD"),
      self.new("🌥", [:sun_behind_large_cloud], "WHITE SUN BEHIND CLOUD"),
      self.new("🌦", [:sun_behind_cloud_with_rain, :partly_sunny_rain], "WHITE SUN BEHIND CLOUD WITH RAIN"),
      self.new("🌧", [:cloud_with_rain, :rain_cloud], "CLOUD WITH RAIN"),
      self.new("🌨", [:cloud_with_snow, :snow_cloud], "CLOUD WITH SNOW"),
      self.new("🌩", [:cloud_with_lightning, :lightning], "CLOUD WITH LIGHTNING"),
      self.new("🌪", [:cloud_with_tornado, :tornado], "CLOUD WITH TORNADO"),
      self.new("🌫", [:fog], "FOG"),
      self.new("🌬", [:wind_face, :wind_blowing_face], "WIND BLOWING FACE"),
      self.new("☃", [:snowman_with_snow], "SNOWMAN"),
      self.new("☄", [:comet], "COMET"),
      self.new("☘", [:shamrock], "SHAMROCK"),

      # Animals
      self.new("🐱", [:cat], "CAT FACE"),
      self.new("🐶", [:dog], "DOG FACE"),
      self.new("🐭", [:mouse], "MOUSE FACE"),
      self.new("🐹", [:hamster], "HAMSTER FACE"),
      self.new("🐰", [:rabbit], "RABBIT FACE"),
      self.new("🐺", [:wolf], "WOLF FACE"),
      self.new("🐸", [:frog], "FROG FACE"),
      self.new("🐯", [:tiger], "TIGER FACE"),
      self.new("🐨", [:koala]),
      self.new("🐻", [:bear], "BEAR FACE"),
      self.new("🐷", [:pig], "PIG FACE"),
      self.new("🐽", [:pig_nose]),
      self.new("🐮", [:cow], "COW FACE"),
      self.new("🐗", [:boar]),
      self.new("🐵", [:monkey_face]),
      self.new("🐒", [:monkey]),
      self.new("🐴", [:horse], "HORSE FACE"),
      self.new("🐎", [:racehorse], "HORSE"),
      self.new("🐫", [:camel], "BACTRIAN CAMEL"), # "has two humps"
      self.new("🐑", [:sheep]),
      self.new("🐘", [:elephant]),
      self.new("🐼", [:panda_face]),
      self.new("🐍", [:snake]),
      self.new("🐦", [:bird]),
      self.new("🐤", [:baby_chick]),
      self.new("🐥", [:hatched_chick], "FRONT-FACING BABY CHICK"),
      self.new("🐣", [:hatching_chick]),
      self.new("🐔", [:chicken]),
      self.new("🐧", [:penguin]),
      self.new("🐢", [:turtle]),
      self.new("🐛", [:bug]),
      self.new("🐝", [:honeybee, :bee]),
      self.new("🐜", [:ant]),
      self.new("🐞", [:beetle], "LADY BEETLE"), # "ladybird, ladybug, coccinellids"
      self.new("🐌", [:snail]),
      self.new("🐙", [:octopus]),
      self.new("🐠", [:tropical_fish]),
      self.new("🐟", [:fish]),
      self.new("🐳", [:whale], "SPOUTING WHALE"),
      self.new("🐋", [:whale2], "WHALE"),
      self.new("🐬", [:dolphin]),
      self.new("🐄", [:cow2], "COW"),
      self.new("🐏", [:ram]),
      self.new("🐀", [:rat]),
      self.new("🐃", [:water_buffalo]),
      self.new("🐅", [:tiger2], "TIGER"),
      self.new("🐇", [:rabbit2], "RABBIT"),
      self.new("🐉", [:dragon]),
      self.new("🐐", [:goat]),
      self.new("🐓", [:rooster]),
      self.new("🐕", [:dog2], "DOG"),
      self.new("🐖", [:pig2], "PIG"),
      self.new("🐁", [:mouse2], "MOUSE"),
      self.new("🐂", [:ox]),
      self.new("🐲", [:dragon_face]),
      self.new("🐡", [:blowfish]),
      self.new("🐊", [:crocodile]),
      self.new("🐪", [:dromedary_camel]), # "has a single hump"
      self.new("🐆", [:leopard]),
      self.new("🐈", [:cat2], "CAT"),
      self.new("🐩", [:poodle]),
      self.new("🐾", [:paw_prints]),
      self.new("🦁", [:lion, :lion_face]),
      self.new("🦄", [:unicorn, :unicorn_face]),
      self.new("🦃", [:turkey]),
      self.new("🦀", [:crab]),
      self.new("🦂", [:scorpion]),
      self.new("🕷", [:spider]),
      self.new("🕸", [:spider_web]),
      self.new("🕊", [:dove_of_peace]),
      self.new("🐿", [:chipmunk]),
      # Flowers
      self.new("💐", [:bouquet]),
      self.new("🌸", [:cherry_blossom]),
      self.new("🌷", [:tulip]),
      self.new("🍀", [:four_leaf_clover]),
      self.new("🌹", [:rose]),
      self.new("🌻", [:sunflower]),
      self.new("🌺", [:hibiscus]),
      self.new("🍁", [:maple_leaf]),
      self.new("🍃", [:leaves], "LEAF FLUTTERING IN WIND"),
      self.new("🍂", [:fallen_leaf]),
      self.new("🌿", [:herb]),
      self.new("🍄", [:mushroom]),
      self.new("🌵", [:cactus]),
      self.new("🌴", [:palm_tree]),
      self.new("🌲", [:evergreen_tree]),
      self.new("🌳", [:deciduous_tree]),
      self.new("🌰", [:chestnut]),
      self.new("🌱", [:seedling]),
      self.new("🌼", [:blossom]), # "daisy"
      self.new("🌾", [:ear_of_rice]),
      self.new("🐚", [:shell], "SPIRAL SHELL"),
      self.new("🌐", [:globe_with_meridians]), # "used to indicate international input source, world clocks with time zones, etc."
      self.new("🏵", [:rosette]),
      # Moon
      self.new("🌞", [:sun_with_face]),
      self.new("🌝", [:full_moon_with_face]),
      self.new("🌚", [:new_moon_with_face]),
      self.new("🌑", [:new_moon], "NEW MOON SYMBOL"),
      self.new("🌒", [:waxing_crescent_moon], "WAXING CRESCENT MOON SYMBOL"),
      self.new("🌓", [:first_quarter_moon], "FIRST QUARTER MOON SYMBOL"), # "half moon"
      self.new("🌔", [:waxing_gibbous_moon], "WAXING GIBBOUS MOON SYMBOL"), # "waxing moon"
      self.new("🌕", [:full_moon], "FULL MOON SYMBOL"),
      self.new("🌖", [:waning_gibbous_moon], "WAINING GIBBOUS MOON SYMBOL"),
      self.new("🌗", [:last_quarter_moon], "LAST QUARTER MOON SYMBOL"),
      self.new("🌘", [:waning_crescent_moon], "WANING CRESCENT MOON SYMBOL"),
      self.new("🌜", [:last_quarter_moon_with_face]),
      self.new("🌛", [:first_quarter_moon_with_face]),
      self.new("🌙", [:moon, :crescent_moon], "CRESCENT MOON"), # "may indicate either the first or last quarter moon"
      self.new("🌍", [:earth_africa], "EARTH GLOBE EUROPE-AFRICA"),
      self.new("🌎", [:earth_americas], "EARTH GLOBE AMERICAS"),
      self.new("🌏", [:earth_asia], "EARTH GLOBE ASIA-AUSTRALIA"),
      self.new("🌋", [:volcano]),
      self.new("🌌", [:milky_way]),
      self.new("⛅" , [:partly_sunny, :barely_sunny], "SUN BEHIND CLOUD"),
      self.new("⛈", [:thunder_cloud_and_rain], "THUNDER CLOUD AND RAIN"),
    ]
  end
end
