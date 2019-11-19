module TinyTownsRandomizerHelper

  def randomize_ensure_different_for(all_options)
    current_option = all_options.first
    all_options.shuffle
    all_options << all_options.shift if current_option == all_options.first
  end

end
