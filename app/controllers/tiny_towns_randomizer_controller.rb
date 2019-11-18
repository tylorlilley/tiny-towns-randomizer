class TinyTownsRandomizerController < ApplicationController

  RED_BUILDINGS =   %w( Farm Greenhouse Orchard Granary )
  BLUE_BUILDINGS =  %w( Cottage )
  ORANGE_BUILDINGS =  %w( Cloister Abbey Temple Chapel )
  YELLOW_BUILDINGS =  %w( Tailor Theater Bakery Merchant )
  GRAY_BUILDINGS =  %w( Millstone Well Fountain Shed )
  BLACK_BUILDINGS =  %w( Factory Trading\ Post Bank Warehouse )
  GREEN_BUILDINGS =  %w( Inn Almshouse Feast\ Hall Tavern )
  PURPLE_BUILDINGS = %w( Obelisk\ of\ the\ Crescent Cathedral\ of\ Caterina Opaleye's\ Watch
                          Archive\ of\ the\ Second\ Age The\ Starloom The\ Sky\ Baths
                          Architect's\ Guild Grand\ Mausoleum\ of\ the\ Rodina Silva\ Forum
                          Shrine\ of\ the\ Elder\ Tree Barrett\ Castle Grove\ University
                          Statue\ of\ the\ Bondmaker Fort\ Ironweed
                        )

  def index
    @red_buildings = RED_BUILDINGS.shuffle
    @blue_buildings = BLUE_BUILDINGS.shuffle
    @orange_buildings = ORANGE_BUILDINGS.shuffle
    @yellow_buildings = YELLOW_BUILDINGS.shuffle
    @gray_buildings = GRAY_BUILDINGS.shuffle
    @black_buildings = BLACK_BUILDINGS.shuffle
    @green_buildings = GREEN_BUILDINGS.shuffle
    @purple_buildings = PURPLE_BUILDINGS.shuffle
  end

  private

  def randomize
    red_buildings =   %w( One Two Three Four ).shuffle
    blue_buildings =  %w(Five Six Seven Eight ).shuffle
    return [ @red_buildings.shuffle.first, @blue_buildings.shuffle.first ]
  end

  def randomize_ensure_different_for(all_options)
    current_option = all_options.first
    all_options.shuffle
    all_options << all_options.shift if current_option == all_options.first
  end
end
